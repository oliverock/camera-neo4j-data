from __future__ import annotations

import csv
import json
import os
import re
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Any

from flask import Flask, jsonify, render_template_string, request
from neo4j import GraphDatabase
from neo4j.exceptions import AuthError, ServiceUnavailable

try:
    import ahocorasick  # type: ignore
except Exception:  # pragma: no cover - fallback is used when dependency is unavailable
    ahocorasick = None

try:
    from openai import OpenAI  # type: ignore
except Exception:  # pragma: no cover - optional LLM fallback
    OpenAI = None


NEO4J_URI = os.getenv("NEO4J_URI", "neo4j://127.0.0.1:7687")
NEO4J_USER = os.getenv("NEO4J_USER", "neo4j")
DEFAULT_NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD", "123456789")
NEO4J_DATABASE = os.getenv("NEO4J_DATABASE", "neo4j")
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY", "")

BASE_DIR = Path(__file__).resolve().parent


USE_CASE_PATTERNS = {
    "入门学习": ["新手", "小白", "入门", "初学", "学习摄影", "第一台", "学生", "家用", "便宜", "性价比"],
    "视频创作": ["视频", "拍视频", "vlog", "VLOG", "直播", "短视频", "创作", "自媒体", "拍摄课程"],
    "人像摄影": ["人像", "拍人", "写真", "虚化", "小姐姐", "拍娃", "儿童", "宝宝", "婚礼"],
    "旅行随拍": ["旅行", "旅游", "街拍", "随拍", "日常", "便携", "轻便", "扫街", "出门", "露营"],
    "体育生态摄影": ["体育", "生态", "打鸟", "运动", "连拍", "追焦", "赛车", "篮球", "足球"],
    "商业专业拍摄": ["商业", "专业", "棚拍", "工作室", "高像素", "旗舰", "广告", "产品拍摄"],
    "风光摄影": ["风光", "风景", "山川", "建筑", "高像素", "宽容度"],
    "直播带货": ["直播带货", "带货", "直播间", "连续供电", "采集卡"],
    "街拍扫街": ["街拍", "扫街", "街头", "口袋", "低侵扰"],
    "商业棚拍": ["商业棚拍", "棚拍", "产品图", "商品图", "影棚"],
}

BRAND_PATTERNS = {
    "索尼": ["索尼", "sony", "SONY"],
    "佳能": ["佳能", "canon", "CANON"],
    "尼康": ["尼康", "nikon", "NIKON"],
    "富士": ["富士", "fuji", "FUJI", "fujifilm", "FUJIFILM"],
    "松下": ["松下", "panasonic", "PANASONIC", "lumix", "LUMIX"],
    "徕卡": ["徕卡", "leica", "LEICA"],
    "OM System": ["om system", "OM System", "奥林巴斯", "olympus", "OLYMPUS"],
    "理光": ["理光", "ricoh", "RICOH", "gr3", "GR3"],
    "哈苏": ["哈苏", "hasselblad", "HASSELBLAD"],
    "大疆": ["大疆", "dji", "DJI", "osmo"],
}

CATEGORY_PATTERNS = {
    "全画幅微单": ["全画幅", "全幅", "full frame"],
    "APS-C画幅微单": ["aps-c", "APS-C", "apsc", "半画幅", "残幅"],
    "中画幅微单": ["中画幅", "medium format"],
    "M43微单": ["m43", "M43", "micro four thirds", "松下g", "gh7", "g100"],
    "便携固定镜头相机": ["便携", "固定镜头", "街拍机", "gr iii", "q3", "dlux", "d-lux"],
    "Vlog便携相机": ["口袋相机", "云台相机", "pocket", "osmo", "vlog便携"],
}

CHINESE_DIGITS = {
    "零": 0,
    "一": 1,
    "二": 2,
    "两": 2,
    "三": 3,
    "四": 4,
    "五": 5,
    "六": 6,
    "七": 7,
    "八": 8,
    "九": 9,
}


@dataclass
class Intent:
    query_type: str
    budget: int | None = None
    use_case: str = ""
    brand: str = ""
    category: str = ""
    lens_brand: str = ""
    model: str = ""
    prefer_hot: bool = False
    prefer_value: bool = False
    prefer_latest: bool = False
    lens_request: bool = False
    mount: str = ""


def load_camera_models() -> list[str]:
    models: list[str] = []
    for filename in ["node.csv", "market_camera_nodes.csv", "brand_expansion_nodes.csv", "brand_15_models.csv"]:
        node_csv = BASE_DIR / filename
        if not node_csv.exists():
            continue
        with node_csv.open("r", encoding="utf-8-sig", newline="") as f:
            for row in csv.DictReader(f):
                if row.get("Label") == "CameraModel" and row.get("name"):
                    models.append(row["name"].strip())
    return sorted(models, key=len, reverse=True)


CAMERA_MODELS = load_camera_models()


def build_automaton(patterns: dict[str, list[str]]):
    if ahocorasick is None:
        return None
    automaton = ahocorasick.Automaton()
    for value, words in patterns.items():
        for word in words:
            automaton.add_word(word.lower(), value)
    automaton.make_automaton()
    return automaton


USE_CASE_AUTOMATON = build_automaton(USE_CASE_PATTERNS)
BRAND_AUTOMATON = build_automaton(BRAND_PATTERNS)
CATEGORY_AUTOMATON = build_automaton(CATEGORY_PATTERNS)


def first_match(text: str, patterns: dict[str, list[str]], automaton: Any = None) -> str:
    lowered = text.lower()
    if automaton is not None:
        for _, value in automaton.iter(lowered):
            return value
    for value, words in patterns.items():
        for word in words:
            if word.lower() in lowered:
                return value
    return ""


def chinese_number_to_int(text: str) -> int | None:
    text = text.strip()
    if not text:
        return None
    if text.isdigit():
        return int(text)
    if "万" in text:
        left, _, right = text.partition("万")
        left_value = CHINESE_DIGITS.get(left, None)
        if left_value is None and left.isdigit():
            left_value = int(left)
        if left_value is None:
            return None
        result = left_value * 10000
        if right:
            if right.isdigit():
                result += int(right) * (1000 if len(right) == 1 else 1)
            elif right in CHINESE_DIGITS:
                result += CHINESE_DIGITS[right] * 1000
        return result
    if text in CHINESE_DIGITS:
        return CHINESE_DIGITS[text]
    return None


def parse_budget(text: str) -> int | None:
    normalized = text.replace(",", "").replace("，", "")
    patterns = [
        r"(?:预算|价格|价位)?\s*(\d{4,6})\s*(?:元)?\s*(?:以内|以下|内|左右)?",
        r"(\d+(?:\.\d+)?)\s*[wW万]\s*(?:以内|以下|内|左右)?",
        r"([一二两三四五六七八九]\s*万\s*[一二两三四五六七八九]?)\s*(?:以内|以下|内|左右)?",
    ]
    for pattern in patterns:
        match = re.search(pattern, normalized)
        if not match:
            continue
        raw = match.group(1).replace(" ", "")
        if re.fullmatch(r"\d+(?:\.\d+)?", raw):
            if "万" in match.group(0).lower() or "w" in match.group(0).lower():
                return int(float(raw) * 10000)
            return int(float(raw))
        value = chinese_number_to_int(raw)
        if value:
            return value
    return None


def find_model(text: str) -> str:
    lowered = text.lower().replace(" ", "")
    for model in CAMERA_MODELS:
        compact = model.lower().replace(" ", "")
        if model.lower() in text.lower() or compact in lowered:
            return model
    return ""


def parse_intent(question: str) -> Intent:
    question = question.strip()
    model = find_model(question)
    brand = first_match(question, BRAND_PATTERNS, BRAND_AUTOMATON)
    use_case = first_match(question, USE_CASE_PATTERNS, USE_CASE_AUTOMATON)
    category = first_match(question, CATEGORY_PATTERNS, CATEGORY_AUTOMATON)
    budget = parse_budget(question)

    mentions_lens = "镜头" in question
    has_lens = any(word in question for word in ["已有", "已经有", "手里有", "手上有", "我有", "兼容", "适配"])
    lens_request = any(word in question for word in ["镜头推荐", "配什么镜头", "买什么镜头", "搭配镜头", "镜头怎么选", "推荐镜头", "配镜头"]) or (mentions_lens and not has_lens)
    asks_explain = any(word in question for word in ["为什么", "解释", "怎么样", "值得", "适合我"])
    prefer_hot = any(word in question for word in ["热销", "热门", "销量", "卖得好", "主流", "爆款", "市场"])
    prefer_value = any(word in question for word in ["性价比", "便宜", "划算", "预算有限", "实惠"])
    prefer_latest = any(word in question for word in ["最新", "新款", "新机", "近几年", "今年", "最近发布", "刚发布", "发布较新"])
    mount = ""
    for candidate in ["索尼E卡口", "佳能RF卡口", "尼康Z卡口", "富士X卡口", "L卡口", "M43卡口", "哈苏XCD卡口"]:
        if candidate in question:
            mount = candidate
            break

    if lens_request:
        return maybe_refine_with_llm(question, Intent("lens_recommend", budget, use_case, brand, category, "", model, prefer_hot, prefer_value, prefer_latest, True, mount))
    if model and asks_explain:
        return maybe_refine_with_llm(question, Intent("explain_model", budget, use_case, brand, category, "", model, prefer_hot, prefer_value, prefer_latest, False, mount))
    if has_lens and brand:
        return maybe_refine_with_llm(question, Intent("lens_compatibility", budget, use_case, brand, category, brand, model, prefer_hot, prefer_value, prefer_latest, False, mount))
    if use_case == "入门学习" or any(word in question for word in ["新手", "小白", "入门"]):
        return maybe_refine_with_llm(question, Intent("beginner_recommend", budget, "入门学习", brand, category, "", model, prefer_hot, prefer_value, prefer_latest, False, mount))
    if model:
        return maybe_refine_with_llm(question, Intent("explain_model", budget, use_case, brand, category, "", model, prefer_hot, prefer_value, prefer_latest, False, mount))
    return maybe_refine_with_llm(question, Intent("recommend", budget, use_case, brand, category, "", "", prefer_hot, prefer_value, prefer_latest, False, mount))


def maybe_refine_with_llm(question: str, intent: Intent) -> Intent:
    if not OPENAI_API_KEY or OpenAI is None:
        return intent
    if intent.use_case or intent.brand or intent.category or intent.budget or intent.model or intent.lens_brand:
        return intent
    try:
        client = OpenAI(api_key=OPENAI_API_KEY)
        payload = {
            "question": question,
            "allowed_use_cases": list(USE_CASE_PATTERNS.keys()),
            "allowed_brands": list(BRAND_PATTERNS.keys()),
            "allowed_categories": list(CATEGORY_PATTERNS.keys()),
        }
        response = client.chat.completions.create(
            model=os.getenv("OPENAI_MODEL", "gpt-4.1-mini"),
            messages=[
                {
                    "role": "system",
                    "content": "你把中文购机问题解析为JSON，只输出JSON。字段：budget整数或null,use_case,brand,category,lens_brand,model,prefer_hot布尔,prefer_value布尔,prefer_latest布尔。",
                },
                {"role": "user", "content": json.dumps(payload, ensure_ascii=False)},
            ],
            temperature=0,
        )
        data = json.loads(response.choices[0].message.content or "{}")
        return Intent(
            query_type="lens_compatibility" if data.get("lens_brand") else "recommend",
            budget=data.get("budget") or intent.budget,
            use_case=data.get("use_case") or intent.use_case,
            brand=data.get("brand") or intent.brand,
            category=data.get("category") or intent.category,
            lens_brand=data.get("lens_brand") or intent.lens_brand,
            model=data.get("model") or intent.model,
            prefer_hot=bool(data.get("prefer_hot", intent.prefer_hot)),
            prefer_value=bool(data.get("prefer_value", intent.prefer_value)),
            prefer_latest=bool(data.get("prefer_latest", intent.prefer_latest)),
            lens_request=bool(data.get("lens_request", intent.lens_request)),
            mount=data.get("mount") or intent.mount,
        )
    except Exception:
        return intent


def cypher_for_intent(intent: Intent) -> tuple[str, dict[str, Any], str]:
    if intent.query_type == "explain_model":
        return (
            """
MATCH (m:CameraModel)
WHERE toLower(m.name) = toLower($model)
OPTIONAL MATCH (m)-[:PRODUCED_BY]->(b:Brand)
OPTIONAL MATCH (m)-[:BELONGS_TO_CATEGORY]->(c:CameraCategory)
OPTIONAL MATCH (m)-[:ACHIEVES_INDEX]->(i:ParameterIndex)
OPTIONAL MATCH (m)-[:HAS_REASON]->(r:Reason)
OPTIONAL MATCH (m)-[:COMPATIBLE_WITH]->(l:Lens)
OPTIONAL MATCH (o:ProductOffer)-[:OFFER_FOR_CAMERA]->(m)
OPTIONAL MATCH (p:PriceRecord)-[:PRICE_OF]->(m)
OPTIONAL MATCH (rv:ReviewRecord)-[:REVIEW_OF]->(m)
RETURN m.name AS 型号,
       b.name AS 品牌,
       c.name AS 类别,
       m.price AS 价格,
       min(o.price) AS 京东采集最低价,
       max(o.soldScore) AS 京东销量热度,
       collect(DISTINCT p.priceType + ':' + toString(p.price))[0..6] AS 价格记录,
       max(rv.mediaScore) AS 媒体评分,
       max(rv.userScore) AS 用户评分,
       collect(DISTINCT rv.pros)[0..3] AS 优点,
       collect(DISTINCT rv.cons)[0..3] AS 缺点,
       m.releaseYear AS 发布年份,
       m.weight AS 重量g,
       m.effectivePixels AS 有效像素万,
       m.ibisStops AS 防抖档位,
       m.afPoints AS 对焦点,
       m.batteryShots AS 续航张数,
       m.cardSlots AS 卡槽数,
       m.screenType AS 屏幕形态,
       m.videoBitrate AS 视频码率,
       m.mount AS 卡口,
       m.marketHotScore AS 市场热度,
       m.marketNote AS 市场备注,
       m.sourcePlatform AS 数据来源,
       collect(DISTINCT i.name) AS 性能指标,
       collect(DISTINCT r.name) AS 推荐理由,
       collect(DISTINCT l.name) AS 兼容镜头,
       collect(DISTINCT o.title)[0..3] AS 京东报价标题
LIMIT 1
""",
            {"model": intent.model},
            f"查询 {intent.model} 的完整解释信息。",
        )

    if intent.query_type == "lens_recommend":
        return (
            """
WITH $budget AS budget,
     $use_case AS useCaseName,
     $brand AS preferredBrand,
     $mount AS preferredMount,
     $prefer_hot AS preferHot,
     $prefer_value AS preferValue
MATCH (l:Lens)
OPTIONAL MATCH (l)-[:PRODUCED_BY]->(b:Brand)
OPTIONAL MATCH (l)-[ls:LENS_SUITABLE_FOR]->(u:UseCase)
OPTIONAL MATCH (m:CameraModel)-[:COMPATIBLE_WITH]->(l)
WITH budget, useCaseName, preferredBrand, preferredMount, preferHot, preferValue, l, b,
     max(CASE
           WHEN useCaseName = '' THEN coalesce(ls.score, 0)
           WHEN u.name = useCaseName THEN coalesce(ls.score, 0)
           ELSE 0
         END) AS useScore,
     collect(DISTINCT m.name)[0..6] AS cameraBodies
WHERE (budget IS NULL OR coalesce(l.price, 0) = 0 OR l.price <= budget)
  AND (preferredBrand = '' OR b.name = preferredBrand OR l.brand = preferredBrand)
  AND (preferredMount = '' OR l.mount = preferredMount)
  AND (useCaseName = '' OR useScore > 0)
WITH l, b, useScore, cameraBodies,
     CASE WHEN budget IS NULL THEN 0 ELSE 12 END AS budgetScore,
     CASE WHEN preferredBrand = '' THEN 0 ELSE 8 END AS brandScore,
     CASE WHEN preferredMount = '' THEN 0 ELSE 12 END AS mountScore,
     CASE WHEN preferHot THEN coalesce(l.marketHotScore, 0) * 0.45 ELSE coalesce(l.marketHotScore, 0) * 0.15 END AS hotScore,
     CASE WHEN preferValue AND coalesce(l.price, 999999) <= 5000 THEN 18 ELSE 0 END AS valueScore
RETURN l.name AS 推荐镜头,
       coalesce(b.name, l.brand) AS 品牌,
       l.mount AS 卡口,
       l.lensType AS 镜头类型,
       l.focalLength AS 焦段,
       l.maxAperture AS 最大光圈,
       l.coverage AS 覆盖画幅,
       l.stabilization AS 防抖,
       l.price AS 价格,
       l.weight AS 重量g,
       l.marketHotScore AS 市场热度,
       l.marketNote AS 镜头说明,
       cameraBodies AS 可适配机身,
       useScore + budgetScore + brandScore + mountScore + hotScore + valueScore AS 综合推荐分
ORDER BY 综合推荐分 DESC, 价格 ASC
LIMIT 8
""",
            {
                "budget": intent.budget,
                "use_case": intent.use_case,
                "brand": intent.brand,
                "mount": intent.mount,
                "prefer_hot": intent.prefer_hot,
                "prefer_value": intent.prefer_value,
            },
            "根据用途、品牌/卡口和预算推荐镜头。",
        )

    if intent.query_type == "lens_compatibility":
        return (
            """
MATCH (m:CameraModel)-[:COMPATIBLE_WITH]->(l:Lens)-[:PRODUCED_BY]->(:Brand {name:$lens_brand})
OPTIONAL MATCH (m)-[:PRODUCED_BY]->(b:Brand)
OPTIONAL MATCH (m)-[:BELONGS_TO_CATEGORY]->(c:CameraCategory)
OPTIONAL MATCH (m)-[:HAS_REASON]->(r:Reason)
OPTIONAL MATCH (o:ProductOffer)-[:OFFER_FOR_CAMERA]->(m)
OPTIONAL MATCH (p:PriceRecord)-[:PRICE_OF]->(m)
OPTIONAL MATCH (rv:ReviewRecord)-[:REVIEW_OF]->(m)
WHERE $budget IS NULL OR m.price <= $budget
RETURN m.name AS 推荐机身,
       b.name AS 品牌,
       c.name AS 类别,
       m.price AS 价格,
       min(o.price) AS 京东采集最低价,
       max(o.soldScore) AS 京东销量热度,
       collect(DISTINCT p.priceType + ':' + toString(p.price))[0..6] AS 价格记录,
       max(rv.mediaScore) AS 媒体评分,
       max(rv.userScore) AS 用户评分,
       count(DISTINCT l) AS 可兼容镜头数,
       m.releaseYear AS 发布年份,
       m.marketHotScore AS 市场热度,
       m.marketNote AS 市场备注,
       collect(DISTINCT l.name) AS 可用镜头,
       collect(DISTINCT r.name) AS 推荐理由,
       collect(DISTINCT o.title)[0..3] AS 京东报价标题
ORDER BY CASE WHEN $prefer_latest THEN coalesce(发布年份, 0) ELSE 0 END DESC,
         可兼容镜头数 DESC,
         价格 ASC
LIMIT 8
""",
            {"lens_brand": intent.lens_brand, "budget": intent.budget, "prefer_latest": intent.prefer_latest},
            f"根据已有{intent.lens_brand}镜头系统，查询兼容机身。",
        )

    use_case = intent.use_case
    return (
        """
WITH $budget AS budget,
     $use_case AS useCaseName,
     $brand AS preferredBrand,
     $category AS preferredCategory,
     $prefer_hot AS preferHot,
     $prefer_value AS preferValue,
     $prefer_latest AS preferLatest
MATCH (m:CameraModel)
MATCH (m)-[:PRODUCED_BY]->(b:Brand)
MATCH (m)-[:BELONGS_TO_CATEGORY]->(c:CameraCategory)
OPTIONAL MATCH (m)-[sf:SUITABLE_FOR]->(u:UseCase)
OPTIONAL MATCH (m)-[:HAS_REASON]->(r:Reason)
OPTIONAL MATCH (o:ProductOffer)-[:OFFER_FOR_CAMERA]->(m)
OPTIONAL MATCH (p:PriceRecord)-[:PRICE_OF]->(m)
OPTIONAL MATCH (rv:ReviewRecord)-[:REVIEW_OF]->(m)
OPTIONAL MATCH (m)-[:COMPATIBLE_WITH]->(lens:Lens)
WITH budget, useCaseName, preferredBrand, preferredCategory, preferHot, preferValue, preferLatest, m, b, c,
     max(CASE
           WHEN useCaseName = '' THEN coalesce(sf.score, 0)
           WHEN u.name = useCaseName THEN coalesce(sf.score, 0)
           ELSE 0
         END) AS useScore,
     collect(DISTINCT r.name) AS reasons,
     min(o.price) AS jdMinPrice,
     max(o.soldScore) AS jdSoldScore,
     collect(DISTINCT o.title)[0..3] AS jdOfferTitles,
     collect(DISTINCT p.priceType + ':' + toString(p.price))[0..6] AS priceRecords,
     max(rv.mediaScore) AS mediaScore,
     max(rv.userScore) AS userScore,
     collect(DISTINCT lens.name)[0..5] AS pairedLenses
WHERE (budget IS NULL OR m.price <= budget)
  AND (preferredBrand = '' OR b.name = preferredBrand)
  AND (preferredCategory = '' OR c.name = preferredCategory)
  AND (useCaseName = '' OR useScore > 0)
WITH m, b, c, useScore, reasons, jdMinPrice, jdSoldScore, jdOfferTitles, priceRecords, mediaScore, userScore, pairedLenses,
     preferLatest,
     CASE WHEN budget IS NULL THEN 0 ELSE 20 END AS budgetScore,
     CASE WHEN preferredBrand = '' THEN 0 ELSE 10 END AS brandScore,
     CASE WHEN preferredCategory = '' THEN 0 ELSE 10 END AS categoryScore,
     CASE WHEN preferHot THEN coalesce(m.marketHotScore, 0) * 0.2 ELSE coalesce(m.marketHotScore, 0) * 0.05 END AS hotScore,
     CASE WHEN preferValue AND coalesce(jdMinPrice, m.price) <= 7000 THEN 18 ELSE 0 END AS valueScore
RETURN m.name AS 推荐型号,
       b.name AS 品牌,
       c.name AS 类别,
       m.price AS 价格,
       jdMinPrice AS 京东采集最低价,
       jdSoldScore AS 京东销量热度,
       priceRecords AS 价格记录,
       mediaScore AS 媒体评分,
       userScore AS 用户评分,
       m.releaseYear AS 发布年份,
       m.weight AS 重量g,
       m.effectivePixels AS 有效像素万,
       m.ibisStops AS 防抖档位,
       m.afPoints AS 对焦点,
       m.batteryShots AS 续航张数,
       m.cardSlots AS 卡槽数,
       m.screenType AS 屏幕形态,
       m.videoBitrate AS 视频码率,
       m.mount AS 卡口,
       m.marketHotScore AS 市场热度,
       m.marketNote AS 市场备注,
       m.sourcePlatform AS 数据来源,
       useScore + budgetScore + brandScore + categoryScore + hotScore + valueScore AS 综合推荐分,
       reasons AS 推荐理由,
       pairedLenses AS 推荐搭配镜头,
       jdOfferTitles AS 京东报价标题
ORDER BY CASE WHEN preferLatest THEN coalesce(发布年份, 0) ELSE 0 END DESC,
         综合推荐分 DESC,
         价格 ASC
LIMIT 8
""",
        {
            "budget": intent.budget,
            "use_case": use_case,
            "brand": intent.brand,
            "category": intent.category,
            "prefer_hot": intent.prefer_hot,
            "prefer_value": intent.prefer_value,
            "prefer_latest": intent.prefer_latest,
        },
        "根据预算、用途、品牌和类别生成综合购买建议。",
    )


def clean_value(value: Any) -> Any:
    if isinstance(value, list):
        return [clean_value(v) for v in value if v not in (None, "")]
    return value


def summarize_results(intent: Intent, rows: list[dict[str, Any]]) -> str:
    if not rows:
        return "没有查到完全符合条件的结果，可以放宽预算、品牌、卡口或用途条件再试。"

    if intent.query_type == "explain_model":
        row = rows[0]
        return (
            f"{row.get('型号')} 是 {row.get('品牌')} 的 {row.get('类别')}，"
            f"参考价格约 {row.get('价格')} 元。"
            f"推荐理由：{'、'.join(row.get('推荐理由') or ['参数和镜头系统较完整'])}。"
        )

    if intent.query_type == "lens_recommend":
        top = rows[0]
        return (
            f"优先推荐 {top.get('推荐镜头')}，品牌为 {top.get('品牌')}，"
            f"卡口为 {top.get('卡口')}，参考价格约 {top.get('价格')} 元。"
            f"它的焦段/光圈是 {top.get('焦段')}/{top.get('最大光圈')}，适合按你的用途搭配机身。"
        )

    name_key = "推荐机身" if intent.query_type == "lens_compatibility" else "推荐型号"
    top = rows[0]
    reasons = top.get("推荐理由") or ["符合你的预算和使用场景"]
    return (
        f"优先推荐 {top.get(name_key)}，品牌为 {top.get('品牌')}，"
        f"参考价格约 {top.get('价格')} 元。主要原因：{'、'.join(reasons)}。"
    )


def has_understandable_intent(intent: Intent) -> bool:
    return any(
        [
            intent.budget is not None,
            bool(intent.use_case),
            bool(intent.brand),
            bool(intent.category),
            bool(intent.lens_brand),
            bool(intent.model),
            bool(intent.mount),
            intent.prefer_hot,
            intent.prefer_value,
            intent.prefer_latest,
            intent.lens_request,
            intent.query_type in {"beginner_recommend", "explain_model", "lens_compatibility"},
        ]
    )


def run_query(cypher: str, params: dict[str, Any], password: str | None = None) -> list[dict[str, Any]]:
    active_password = password or DEFAULT_NEO4J_PASSWORD
    local_driver = GraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, active_password))
    try:
        with local_driver.session(database=NEO4J_DATABASE) as session:
            result = session.run(cypher, params)
            return [{k: clean_value(v) for k, v in record.data().items()} for record in result]
    finally:
        local_driver.close()


app = Flask(__name__)


HTML = r"""
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>相机知识图谱导购对话系统</title>
  <style>
    :root {
      color-scheme: light;
      --bg: #f4f6f8;
      --panel: #ffffff;
      --ink: #172033;
      --muted: #607086;
      --line: #d8dee8;
      --accent: #1265d8;
      --accent-soft: #e8f1ff;
      --good: #0d7a4f;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: "Microsoft YaHei", "Segoe UI", Arial, sans-serif;
      background: var(--bg);
      color: var(--ink);
    }
    .app {
      min-height: 100vh;
      display: grid;
      grid-template-columns: minmax(260px, 360px) 1fr;
    }
    aside {
      padding: 28px 24px;
      background: #172033;
      color: #fff;
    }
    aside h1 {
      margin: 0 0 12px;
      font-size: 26px;
      line-height: 1.2;
      letter-spacing: 0;
    }
    aside p {
      color: #d8e1ef;
      line-height: 1.7;
      margin: 0 0 22px;
      font-size: 14px;
    }
    .password-label {
      display: block;
      margin: 18px 0 8px;
      color: #d8e1ef;
      font-size: 13px;
    }
    .password-input {
      width: 100%;
      border: 1px solid rgba(255,255,255,.24);
      background: rgba(255,255,255,.08);
      color: #fff;
      border-radius: 6px;
      padding: 10px 12px;
      font: inherit;
      outline: none;
    }
    .examples {
      display: grid;
      gap: 10px;
      margin-top: 18px;
    }
    .examples-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      margin-top: 18px;
    }
    .examples-title {
      color: rgba(255,255,255,.78);
      font-size: 13px;
      font-weight: 700;
    }
    .refresh-examples {
      border: 1px solid rgba(255,255,255,.28);
      background: rgba(255,255,255,.12);
      color: #fff;
      width: 34px;
      height: 34px;
      border-radius: 50%;
      cursor: pointer;
      font-size: 18px;
      line-height: 1;
    }
    .refresh-examples:hover {
      background: rgba(255,255,255,.2);
    }
    .examples button {
      text-align: left;
      border: 1px solid rgba(255,255,255,.2);
      background: rgba(255,255,255,.08);
      color: #fff;
      padding: 10px 12px;
      border-radius: 6px;
      cursor: pointer;
      line-height: 1.45;
    }
    main {
      padding: 28px;
      display: grid;
      grid-template-rows: auto auto 1fr;
      gap: 18px;
    }
    .status {
      background: var(--panel);
      border: 1px solid var(--line);
      border-radius: 8px;
      padding: 14px 16px;
      display: flex;
      justify-content: space-between;
      gap: 12px;
      flex-wrap: wrap;
    }
    .status strong { color: var(--good); }
    .chat-box {
      background: var(--panel);
      border: 1px solid var(--line);
      border-radius: 8px;
      padding: 16px;
    }
    .input-row {
      display: grid;
      grid-template-columns: 1fr auto;
      gap: 10px;
    }
    textarea {
      min-height: 84px;
      resize: vertical;
      border: 1px solid var(--line);
      border-radius: 6px;
      padding: 12px;
      font: inherit;
      line-height: 1.6;
    }
    .ask {
      border: 0;
      border-radius: 6px;
      padding: 0 20px;
      background: var(--accent);
      color: #fff;
      font: inherit;
      cursor: pointer;
      min-width: 110px;
    }
    .result-grid {
      display: grid;
      grid-template-columns: minmax(260px, 380px) 1fr;
      gap: 18px;
      align-items: start;
    }
    .panel {
      background: var(--panel);
      border: 1px solid var(--line);
      border-radius: 8px;
      padding: 16px;
      min-width: 0;
    }
    h2 {
      font-size: 18px;
      margin: 0 0 12px;
    }
    .chips {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
    }
    .chip {
      background: var(--accent-soft);
      color: #084caa;
      padding: 6px 9px;
      border-radius: 999px;
      font-size: 13px;
    }
    .answer {
      line-height: 1.7;
      color: var(--ink);
      margin-bottom: 14px;
    }
    .cards {
      display: grid;
      gap: 10px;
    }
    .card {
      border: 1px solid var(--line);
      border-radius: 8px;
      padding: 12px;
      background: #fff;
    }
    .card-title {
      font-weight: 700;
      margin-bottom: 6px;
      display: flex;
      justify-content: space-between;
      gap: 12px;
    }
    .meta {
      color: var(--muted);
      font-size: 13px;
      line-height: 1.7;
    }
    pre {
      white-space: pre-wrap;
      word-break: break-word;
      background: #111827;
      color: #d8e1ef;
      border-radius: 8px;
      padding: 14px;
      overflow: auto;
      max-height: 360px;
    }
    .empty {
      color: var(--muted);
      line-height: 1.8;
    }
    @media (max-width: 900px) {
      .app { grid-template-columns: 1fr; }
      .result-grid { grid-template-columns: 1fr; }
      aside { padding: 22px; }
      main { padding: 18px; }
      .input-row { grid-template-columns: 1fr; }
      .ask { min-height: 44px; }
    }
  </style>
</head>
<body>
  <div class="app">
    <aside>
      <h1>相机知识图谱导购对话系统</h1>
      <p>输入自然语言问题，系统会识别预算、用途、品牌、类别或已有镜头，并生成 Cypher 查询 Neo4j 知识图谱。</p>
      <label class="password-label" for="password">Neo4j 密码</label>
      <input id="password" class="password-input" type="password" value="{{ password }}" autocomplete="current-password">
      <div class="examples-header">
        <span class="examples-title">示例问题</span>
        <button id="refreshExamples" class="refresh-examples" title="刷新示例问题" type="button">↻</button>
      </div>
      <div id="examples" class="examples"></div>
    </aside>
    <main>
      <div class="status">
        <span>Neo4j URI：<strong>{{ uri }}</strong></span>
        <span>数据库：<strong>{{ database }}</strong></span>
      </div>
      <section class="chat-box">
        <div class="input-row">
          <textarea id="question" placeholder="例如：新手小白应该买什么相机？"></textarea>
          <button class="ask" id="askBtn">生成建议</button>
        </div>
      </section>
      <section class="result-grid">
        <div class="panel">
          <h2>识别结果</h2>
          <div id="intent" class="chips"><span class="empty">还没有提问</span></div>
        </div>
        <div class="panel">
          <h2>导购回答</h2>
          <div id="answer" class="empty">选择一个示例问题，或直接输入你的购买需求。</div>
          <div id="cards" class="cards"></div>
          <h2 style="margin-top:18px;">生成的 Cypher</h2>
          <pre id="cypher">// 等待生成</pre>
        </div>
      </section>
    </main>
  </div>
  <script>
    const q = document.querySelector("#question");
    const askBtn = document.querySelector("#askBtn");
    const password = document.querySelector("#password");
    const answer = document.querySelector("#answer");
    const cards = document.querySelector("#cards");
    const cypher = document.querySelector("#cypher");
    const intentBox = document.querySelector("#intent");
    const examples = document.querySelector("#examples");
    const refreshExamples = document.querySelector("#refreshExamples");

    const exampleQuestions = [
      "最新的相机推荐",
      "推荐最新的索尼相机",
      "新手预算5000以内，推荐热销相机",
      "预算8000以内，想旅行随拍，推荐轻便相机",
      "预算17000以内，想拍视频，推荐索尼相机",
      "想拍人像，预算12000以内，推荐佳能相机",
      "想拍风光，推荐尼康全画幅相机",
      "想拍体育和生态，有什么相机推荐？",
      "直播带货适合买什么相机？",
      "街拍扫街，推荐便携相机",
      "索尼E卡口人像镜头推荐，预算5000以内",
      "佳能RF卡口拍人像配什么镜头？",
      "推荐适合风光的尼康Z卡口镜头",
      "富士X卡口旅行镜头推荐",
      "已有索尼镜头，应该买什么机身？",
      "已有佳能镜头，推荐最新机身",
      "已有尼康Z卡口镜头，推荐相机",
      "Alpha 7 IV 为什么适合我？",
      "EOS R6 Mark II 为什么值得买？",
      "ZV-E10 II 适合新手吗？",
      "预算10000以内，推荐性价比高的相机",
      "预算20000以内，拍视频和人像兼顾",
      "中画幅相机有哪些推荐？",
      "我想要轻便一点，主要拍旅行和日常",
      "今天天气怎么样"
    ];

    function pickExamples() {
      const pool = [...exampleQuestions];
      const selected = [];
      while (pool.length && selected.length < 5) {
        const index = Math.floor(Math.random() * pool.length);
        selected.push(pool.splice(index, 1)[0]);
      }
      return selected;
    }

    function renderExamples() {
      examples.innerHTML = "";
      pickExamples().forEach(question => {
        const btn = document.createElement("button");
        btn.type = "button";
        btn.dataset.q = question;
        btn.textContent = question;
        btn.addEventListener("click", () => {
          q.value = question;
          ask();
        });
        examples.appendChild(btn);
      });
    }

    refreshExamples.addEventListener("click", renderExamples);
    renderExamples();
    askBtn.addEventListener("click", ask);

    function renderIntent(intent) {
      const labels = {
        query_type: "查询类型",
        budget: "预算",
        use_case: "用途",
        brand: "品牌",
        category: "类别",
        lens_brand: "已有镜头",
        model: "型号",
        prefer_hot: "偏好热销",
        prefer_value: "偏好性价比",
        prefer_latest: "偏好最新",
        lens_request: "镜头需求",
        mount: "卡口"
      };
      const chips = Object.entries(intent)
        .filter(([_, v]) => v !== null && v !== "")
        .map(([k, v]) => `<span class="chip">${labels[k] || k}: ${v}</span>`);
      intentBox.innerHTML = chips.length ? chips.join("") : "<span class='empty'>未识别出具体条件</span>";
    }

    function renderCards(rows) {
      cards.innerHTML = "";
      rows.forEach(row => {
        const title = row["推荐型号"] || row["推荐机身"] || row["推荐镜头"] || row["型号"] || "推荐结果";
        const price = row["价格"] ? `¥${row["价格"]}` : "";
        const reasons = Array.isArray(row["推荐理由"]) ? row["推荐理由"].filter(Boolean).join("、") : "";
        const lens = Array.isArray(row["可用镜头"]) ? row["可用镜头"].join("、") : "";
        const compatible = Array.isArray(row["兼容镜头"]) ? row["兼容镜头"].join("、") : "";
        const paired = Array.isArray(row["推荐搭配镜头"]) ? row["推荐搭配镜头"].filter(Boolean).join("、") : "";
        const cameraBodies = Array.isArray(row["可适配机身"]) ? row["可适配机身"].filter(Boolean).join("、") : "";
        const indexes = Array.isArray(row["性能指标"]) ? row["性能指标"].join("、") : "";
        const jdTitles = Array.isArray(row["京东报价标题"]) ? row["京东报价标题"].filter(Boolean).join("；") : "";
        const priceRecords = Array.isArray(row["价格记录"]) ? row["价格记录"].filter(Boolean).join("；") : "";
        const pros = Array.isArray(row["优点"]) ? row["优点"].filter(Boolean).join("；") : "";
        const cons = Array.isArray(row["缺点"]) ? row["缺点"].filter(Boolean).join("；") : "";
        const html = `
          <div class="card">
            <div class="card-title"><span>${title}</span><span>${price}</span></div>
            <div class="meta">
              ${row["品牌"] ? `品牌：${row["品牌"]}<br>` : ""}
              ${row["类别"] ? `类别：${row["类别"]}<br>` : ""}
              ${row["京东采集最低价"] ? `京东采集最低价：¥${row["京东采集最低价"]}<br>` : ""}
              ${row["京东销量热度"] ? `京东销量热度：${row["京东销量热度"]}<br>` : ""}
              ${priceRecords ? `价格记录：${priceRecords}<br>` : ""}
              ${row["媒体评分"] ? `媒体评分：${row["媒体评分"]}<br>` : ""}
              ${row["用户评分"] ? `用户评分：${row["用户评分"]}<br>` : ""}
              ${row["发布年份"] ? `发布年份：${row["发布年份"]}<br>` : ""}
              ${row["重量g"] ? `重量：${row["重量g"]}g<br>` : ""}
              ${row["有效像素万"] ? `有效像素：${row["有效像素万"]}万<br>` : ""}
              ${row["防抖档位"] ? `防抖：${row["防抖档位"]}档<br>` : ""}
              ${row["对焦点"] ? `对焦点：${row["对焦点"]}<br>` : ""}
              ${row["续航张数"] ? `续航：${row["续航张数"]}张<br>` : ""}
              ${row["卡槽数"] ? `卡槽：${row["卡槽数"]}<br>` : ""}
              ${row["屏幕形态"] ? `屏幕：${row["屏幕形态"]}<br>` : ""}
              ${row["视频码率"] ? `视频码率：${row["视频码率"]}<br>` : ""}
              ${row["卡口"] ? `卡口：${row["卡口"]}<br>` : ""}
              ${row["镜头类型"] ? `镜头类型：${row["镜头类型"]}<br>` : ""}
              ${row["焦段"] ? `焦段：${row["焦段"]}<br>` : ""}
              ${row["最大光圈"] ? `最大光圈：${row["最大光圈"]}<br>` : ""}
              ${row["覆盖画幅"] ? `覆盖画幅：${row["覆盖画幅"]}<br>` : ""}
              ${row["防抖"] ? `防抖：${row["防抖"]}<br>` : ""}
              ${row["市场热度"] ? `市场热度：${row["市场热度"]}<br>` : ""}
              ${row["综合推荐分"] ? `综合推荐分：${row["综合推荐分"]}<br>` : ""}
              ${row["可兼容镜头数"] ? `可兼容镜头数：${row["可兼容镜头数"]}<br>` : ""}
              ${row["市场备注"] ? `市场备注：${row["市场备注"]}<br>` : ""}
              ${row["数据来源"] ? `数据来源：${row["数据来源"]}<br>` : ""}
              ${reasons ? `推荐理由：${reasons}<br>` : ""}
              ${pros ? `优点：${pros}<br>` : ""}
              ${cons ? `缺点：${cons}<br>` : ""}
              ${indexes ? `性能指标：${indexes}<br>` : ""}
              ${lens ? `可用镜头：${lens}<br>` : ""}
              ${compatible ? `兼容镜头：${compatible}<br>` : ""}
              ${paired ? `推荐搭配镜头：${paired}<br>` : ""}
              ${cameraBodies ? `可适配机身：${cameraBodies}<br>` : ""}
              ${jdTitles ? `京东报价：${jdTitles}<br>` : ""}
            </div>
          </div>`;
        cards.insertAdjacentHTML("beforeend", html);
      });
    }

    async function ask() {
      const question = q.value.trim();
      if (!question) return;
      answer.textContent = "正在查询知识图谱...";
      cards.innerHTML = "";
      cypher.textContent = "";
      try {
        const res = await fetch("/ask", {
          method: "POST",
          headers: {"Content-Type": "application/json"},
          body: JSON.stringify({question, password: password.value})
        });
        const data = await res.json();
        renderIntent(data.intent || {});
        cypher.textContent = data.cypher || "";
        if (!res.ok || data.error) {
          answer.textContent = data.error || "查询失败";
          return;
        }
        answer.textContent = data.answer;
        renderCards(data.rows || []);
      } catch (err) {
        answer.textContent = "请求失败，请确认 Flask 服务仍在运行。";
      }
    }
  </script>
</body>
</html>
"""


@app.get("/")
def index():
    return render_template_string(
        HTML,
        uri=NEO4J_URI,
        database=NEO4J_DATABASE,
        password=DEFAULT_NEO4J_PASSWORD,
    )


@app.post("/ask")
def ask():
    payload = request.get_json(silent=True) or {}
    question = str(payload.get("question", "")).strip()
    password = str(payload.get("password", "")).strip() or DEFAULT_NEO4J_PASSWORD
    if not question:
        return jsonify({"error": "请输入购买问题。"}), 400

    intent = parse_intent(question)
    if not has_understandable_intent(intent):
        return jsonify(
            {
                "question": question,
                "intent": asdict(intent),
                "description": "自然语言问题未匹配到可查询的相机知识图谱意图。",
                "cypher": "",
                "params": {},
                "answer": "暂时没能理解您的意思，请重新输入",
                "rows": [],
            }
        )

    cypher, params, description = cypher_for_intent(intent)
    try:
        rows = run_query(cypher, params, password=password)
    except AuthError:
        return jsonify(
            {
                "error": "Neo4j 用户名或密码错误，请检查 NEO4J_PASSWORD 或代码中的默认密码。",
                "intent": asdict(intent),
                "cypher": cypher.strip(),
            }
        ), 500
    except ServiceUnavailable:
        return jsonify(
            {
                "error": "无法连接 Neo4j，请确认 Neo4j Desktop 数据库已启动。",
                "intent": asdict(intent),
                "cypher": cypher.strip(),
            }
        ), 500
    except Exception as exc:
        return jsonify(
            {
                "error": f"查询失败：{exc}",
                "intent": asdict(intent),
                "cypher": cypher.strip(),
            }
        ), 500

    return jsonify(
        {
            "question": question,
            "intent": asdict(intent),
            "description": description,
            "cypher": cypher.strip(),
            "params": params,
            "answer": summarize_results(intent, rows),
            "rows": rows,
        }
    )


@app.get("/health")
def health():
    try:
        rows = run_query("MATCH (n:Entity) RETURN count(n) AS nodes", {})
        return jsonify({"ok": True, "neo4j": NEO4J_URI, "database": NEO4J_DATABASE, "nodes": rows[0]["nodes"]})
    except Exception as exc:
        return jsonify({"ok": False, "error": str(exc)}), 500


if __name__ == "__main__":
    print("相机知识图谱导购系统启动中...")
    print(f"Neo4j: {NEO4J_URI}  Database: {NEO4J_DATABASE}  User: {NEO4J_USER}")
    print("访问地址: http://127.0.0.1:5000")
    app.run(host="127.0.0.1", port=5000, debug=False)
