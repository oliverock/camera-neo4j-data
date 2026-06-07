from __future__ import annotations

import csv
import re
import time
from dataclasses import dataclass, asdict
from pathlib import Path
from urllib.parse import quote

import requests


BASE_DIR = Path(__file__).resolve().parent
OUT = BASE_DIR / "market_crawl_raw.csv"

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/126 Safari/537.36",
    "Accept-Language": "zh-CN,zh;q=0.9",
}

QUERIES = [
    "微单相机",
    "索尼 微单 相机",
    "佳能 微单 相机",
    "尼康 微单 相机",
    "富士 微单 相机",
    "索尼 微单 镜头",
    "佳能 RF 镜头",
    "尼康 Z 镜头",
    "富士 XF 镜头",
]


@dataclass
class CrawlItem:
    platform: str
    query: str
    title: str
    price: str
    url: str
    raw_source: str


def clean(text: str) -> str:
    return re.sub(r"\s+", " ", text or "").strip()


def fetch(url: str) -> str:
    response = requests.get(url, headers=HEADERS, timeout=20)
    response.raise_for_status()
    return response.text


def crawl_jd(query: str) -> list[CrawlItem]:
    url = f"https://search.jd.com/Search?keyword={quote(query)}&enc=utf-8"
    html = fetch(url)
    items: list[CrawlItem] = []
    # JD often renders search results dynamically or redirects under anti-bot rules.
    for match in re.finditer(r'<li[^>]+data-sku="(?P<sku>\d+)".*?</li>', html, flags=re.S):
        block = match.group(0)
        title_match = re.search(r'<em>(.*?)</em>', block, flags=re.S)
        price_match = re.search(r'<i>([\d.]+)</i>', block, flags=re.S)
        title = clean(re.sub(r"<.*?>", "", title_match.group(1))) if title_match else ""
        price = price_match.group(1) if price_match else ""
        if title:
            sku = match.group("sku")
            items.append(CrawlItem("京东", query, title, price, f"https://item.jd.com/{sku}.html", "search.jd.com"))
    return items


def crawl_taobao(query: str) -> list[CrawlItem]:
    url = f"https://s.taobao.com/search?q={quote(query)}"
    html = fetch(url)
    items: list[CrawlItem] = []
    # Taobao is heavily dynamic; this catches titles if embedded in initial JSON.
    for title in sorted(set(re.findall(r'"raw_title"\s*:\s*"([^"]+)"', html))):
        if any(word in title for word in ["相机", "微单", "镜头", "索尼", "佳能", "尼康", "富士"]):
            items.append(CrawlItem("淘宝", query, clean(title), "", url, "s.taobao.com"))
    return items


def main() -> None:
    rows: list[CrawlItem] = []
    for query in QUERIES:
        for platform, crawler in [("京东", crawl_jd), ("淘宝", crawl_taobao)]:
            try:
                found = crawler(query)
                print(f"{platform} {query}: {len(found)} items")
                rows.extend(found[:20])
            except Exception as exc:
                print(f"{platform} {query}: failed - {exc}")
            time.sleep(1)
    with OUT.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(CrawlItem.__dataclass_fields__.keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))
    print(f"saved: {OUT}")


if __name__ == "__main__":
    main()
