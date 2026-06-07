from __future__ import annotations

import csv
import json
import re
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent
RAW = BASE_DIR / "jd_current_items.json"
OFFERS_CSV = BASE_DIR / "jd_product_offers.csv"
OFFER_REL_CSV = BASE_DIR / "jd_offer_relations.csv"
IMPORT_CYPHER = BASE_DIR / "jd_offer_import.cypher"


MODEL_RULES = [
    (r"ZV[- ]?E10", "cam_zve10", "ZV-E10"),
    (r"A7C2|Alpha\s*7C\s*II", "cam_a7c2", "Alpha 7C II"),
    (r"EOS\s*R100|R100", "cam_r100", "EOS R100"),
    (r"EOS\s*R50|R50", "cam_r50", "EOS R50"),
    (r"XT5|X-T5", "cam_xt5", "X-T5"),
    (r"XT30III|X-T30III|XT30三代", "cam_xt30iii", "X-T30III"),
]

LENS_RULES = [
    (r"RF[- ]?S\s*18[- ]?45|18-45", "lens_c1845", "RF-S 18-45mm F4.5-6.3 IS STM"),
    (r"E\\s*PZ\\s*16[- ]?50|16-50", "lens_s1650p", "E PZ 16-50mm F3.5-5.6 OSS"),
    (r"55[- ]?210", "lens_s55210", "E 55-210mm F4.5-6.3 OSS"),
    (r"16\\s*55|16-55", "lens_f1655", "XF 16-55mm F2.8 R LM WR"),
    (r"XC15[- ]?45|15-45", "lens_f1545", "XC 15-45mm F3.5-5.6 OIS PZ"),
]

BRAND_BY_MODEL = {
    "cam_zve10": "索尼",
    "cam_a7c2": "索尼",
    "cam_r100": "佳能",
    "cam_r50": "佳能",
    "cam_xt5": "富士",
    "cam_xt30iii": "富士",
}

CATEGORY_BY_MODEL = {
    "cam_a7c2": "全画幅微单",
    "cam_zve10": "APS-C画幅微单",
    "cam_r100": "APS-C画幅微单",
    "cam_r50": "APS-C画幅微单",
    "cam_xt5": "APS-C画幅微单",
    "cam_xt30iii": "APS-C画幅微单",
}


def match_rule(text: str, rules: list[tuple[str, str, str]]) -> tuple[str, str]:
    for pattern, node_id, name in rules:
        if re.search(pattern, text, flags=re.I):
            return node_id, name
    return "", ""


def sold_score(sold: str) -> int:
    if not sold:
        return 0
    match = re.search(r"已售([0-9.]+)(万)?\+", sold)
    if not match:
        return 0
    value = float(match.group(1))
    if match.group(2):
        value *= 10000
    return int(value)


def esc(value: str) -> str:
    return (value or "").replace("\\", "\\\\").replace("'", "\\'")


def num(value: str) -> float | None:
    try:
        return float(value)
    except Exception:
        return None


def main() -> None:
    items = json.loads(RAW.read_text(encoding="utf-8"))
    offers: list[dict[str, str]] = []
    rels: list[dict[str, str]] = []
    needed_new_nodes: dict[str, dict[str, str]] = {}

    for item in items:
        text = f"{item.get('title','')} {item.get('text','')}"
        model_id, model_name = match_rule(text, MODEL_RULES)
        if not model_id:
            continue
        lens_id, lens_name = match_rule(text, LENS_RULES)
        offer_id = f"offer_jd_{item['sku']}"
        price = item.get("price", "")
        offer = {
            "id": offer_id,
            "name": item.get("title", "")[:80],
            "Label": "ProductOffer",
            "platform": item.get("platform", "京东"),
            "keyword": item.get("keyword", ""),
            "sku": item.get("sku", ""),
            "title": item.get("title", ""),
            "price": price,
            "shop": item.get("shop", ""),
            "sold": item.get("sold", ""),
            "soldScore": str(sold_score(item.get("sold", ""))),
            "rank": item.get("rank", ""),
            "url": item.get("url", ""),
            "capturedAt": item.get("capturedAt", ""),
            "cameraModel": model_name,
            "lensModel": lens_name,
        }
        offers.append(offer)
        rels.append({"from_id": offer_id, "to_id": model_id, "type": "offerForCamera", "note": "京东搜索页采集商品报价"})
        if lens_id:
            rels.append({"from_id": offer_id, "to_id": lens_id, "type": "offerIncludesLens", "note": "标题识别出的套机镜头"})
        if model_id == "cam_xt30iii":
            needed_new_nodes[model_id] = {
                "id": model_id,
                "name": model_name,
                "Label": "CameraModel",
                "brand": "富士",
                "category": "APS-C画幅微单",
                "price": price or "6049",
                "releaseYear": "2025",
                "weight": "",
                "marketHotScore": "79",
                "sourcePlatform": "京东登录态搜索页",
                "sourceTitle": item.get("title", ""),
                "sourceUrl": item.get("url", ""),
                "marketNote": "京东搜索页出现的富士入门复古微单，适合入门、街拍和Vlog",
            }
            rels.extend(
                [
                    {"from_id": model_id, "to_id": "brand_fuji", "type": "producedBy", "note": ""},
                    {"from_id": model_id, "to_id": "cat_apsc", "type": "belongsToCategory", "note": ""},
                    {"from_id": model_id, "to_id": "use_beginner", "type": "suitableFor", "note": "复古入门微单，适合新手"},
                    {"from_id": model_id, "to_id": "use_travel", "type": "suitableFor", "note": "轻便适合街拍旅行"},
                    {"from_id": model_id, "to_id": "reason_light", "type": "hasReason", "note": ""},
                ]
            )

    with OFFERS_CSV.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(offers[0].keys()) if offers else [])
        if offers:
            writer.writeheader()
            writer.writerows(offers)

    with OFFER_REL_CSV.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["from_id", "to_id", "type", "note"])
        writer.writeheader()
        writer.writerows(rels)

    lines = [
        "// JD current search-page product offers import",
        "CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;",
        "",
    ]
    for node in needed_new_nodes.values():
        lines.append(f"MERGE (n:Entity {{id: '{esc(node['id'])}'}})")
        lines.append(f"SET n:{node['Label']}")
        for key, value in node.items():
            if key in {"id", "Label"} or value == "":
                continue
            value_num = num(value)
            if value_num is not None and key not in {"name"}:
                lines.append(f"SET n.{key} = {int(value_num) if value_num.is_integer() else value_num}")
            else:
                lines.append(f"SET n.{key} = '{esc(value)}'")
        lines.append(";\n")

    for offer in offers:
        lines.append(f"MERGE (n:Entity {{id: '{esc(offer['id'])}'}})")
        lines.append("SET n:ProductOffer")
        for key, value in offer.items():
            if key in {"id", "Label"} or value == "":
                continue
            value_num = num(value)
            if value_num is not None and key in {"price", "soldScore"}:
                lines.append(f"SET n.{key} = {int(value_num) if value_num.is_integer() else value_num}")
            else:
                lines.append(f"SET n.{key} = '{esc(value)}'")
        lines.append(";\n")

    rel_types = {
        "offerForCamera": "OFFER_FOR_CAMERA",
        "offerIncludesLens": "OFFER_INCLUDES_LENS",
        "producedBy": "PRODUCED_BY",
        "belongsToCategory": "BELONGS_TO_CATEGORY",
        "suitableFor": "SUITABLE_FOR",
        "hasReason": "HAS_REASON",
    }
    for rel in rels:
        rel_type = rel_types[rel["type"]]
        lines.append(f"MATCH (a:Entity {{id: '{esc(rel['from_id'])}'}}), (b:Entity {{id: '{esc(rel['to_id'])}'}})")
        lines.append(f"MERGE (a)-[r:{rel_type}]->(b)")
        if rel.get("note"):
            lines.append(f"SET r.note = '{esc(rel['note'])}'")
        lines.append(";\n")

    lines.append("MATCH (n:ProductOffer) RETURN count(n) AS 京东报价节点数;")
    IMPORT_CYPHER.write_text("\n".join(lines), encoding="utf-8")
    print(f"offers={len(offers)} relations={len(rels)}")
    print(OFFERS_CSV)
    print(OFFER_REL_CSV)
    print(IMPORT_CYPHER)


if __name__ == "__main__":
    main()
