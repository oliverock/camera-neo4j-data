from __future__ import annotations

import csv
from pathlib import Path

from neo4j import GraphDatabase


BASE_DIR = Path(__file__).resolve().parent
CSV_OUT = BASE_DIR / "top30_lens_nodes.csv"
REL_OUT = BASE_DIR / "top30_lens_relations.csv"

URI = "neo4j://127.0.0.1:7687"
AUTH = ("neo4j", "123456789")


LENSES = [
    ("lens_s35f18", "FE 35mm F1.8", "brand_sony", "索尼", 3999, 280, "35mm", "F1.8", "索尼E卡口", "定焦", "全画幅", "无", "人像/街拍常用轻便定焦", ["cam_a7m4", "cam_a7c2", "cam_a7c"], ["use_portrait", "use_street"]),
    ("lens_s85f18", "FE 85mm F1.8", "brand_sony", "索尼", 4299, 371, "85mm", "F1.8", "索尼E卡口", "定焦", "全画幅", "无", "高性价比人像定焦", ["cam_a7m4", "cam_a7c2", "cam_a7c"], ["use_portrait"]),
    ("lens_s55f18", "Sonnar T* FE 55mm F1.8 ZA", "brand_sony", "索尼", 4999, 281, "55mm", "F1.8", "索尼E卡口", "定焦", "全画幅", "无", "轻便高画质标准定焦", ["cam_a7m4", "cam_a7c2"], ["use_portrait", "use_street"]),
    ("lens_s20f18g", "FE 20mm F1.8 G", "brand_sony", "索尼", 6499, 373, "20mm", "F1.8", "索尼E卡口", "定焦", "全画幅", "无", "风光星空和Vlog广角定焦", ["cam_a7m4", "cam_a7c2", "cam_fx3"], ["use_landscape", "use_video"]),
    ("lens_s1224f4", "FE 12-24mm F4 G", "brand_sony", "索尼", 11999, 565, "12-24mm", "F4", "索尼E卡口", "超广角变焦", "全画幅", "无", "风光建筑超广角镜头", ["cam_a7r5", "cam_a7m4"], ["use_landscape"]),
    ("lens_s200600", "FE 200-600mm F5.6-6.3 G OSS", "brand_sony", "索尼", 13999, 2115, "200-600mm", "F5.6-6.3", "索尼E卡口", "超长焦变焦", "全画幅", "OSS", "生态体育常用长焦", ["cam_a9m3", "cam_a1"], ["use_sports"]),
    ("lens_c3518", "RF 35mm F1.8 MACRO IS STM", "brand_canon", "佳能", 3499, 305, "35mm", "F1.8", "佳能RF卡口", "定焦", "全画幅", "IS", "轻便人文街拍定焦", ["cam_r8", "cam_r6m2", "cam_rp"], ["use_street", "use_portrait"]),
    ("lens_c8512", "RF 85mm F1.2 L USM", "brand_canon", "佳能", 18999, 1195, "85mm", "F1.2", "佳能RF卡口", "定焦", "全画幅", "无", "高端人像定焦", ["cam_r5m2", "cam_r6m2", "cam_r8"], ["use_portrait"]),
    ("lens_c1535", "RF 15-35mm F2.8 L IS USM", "brand_canon", "佳能", 15999, 840, "15-35mm", "F2.8", "佳能RF卡口", "广角变焦", "全画幅", "IS", "风光视频广角大三元", ["cam_r5m2", "cam_r6m2"], ["use_landscape", "use_video"]),
    ("lens_c100500", "RF 100-500mm F4.5-7.1 L IS USM", "brand_canon", "佳能", 19999, 1530, "100-500mm", "F4.5-7.1", "佳能RF卡口", "超长焦变焦", "全画幅", "IS", "生态体育长焦", ["cam_r3", "cam_r5m2", "cam_r7"], ["use_sports"]),
    ("lens_c2870", "RF 28-70mm F2 L USM", "brand_canon", "佳能", 21999, 1430, "28-70mm", "F2", "佳能RF卡口", "标准变焦", "全画幅", "无", "高端人像商业标准变焦", ["cam_r5m2", "cam_r6m2"], ["use_portrait", "use_studio"]),
    ("lens_c5018", "RF 50mm F1.8 STM", "brand_canon", "佳能", 999, 160, "50mm", "F1.8", "佳能RF卡口", "定焦", "全画幅", "无", "入门人像小痰盂", ["cam_r50", "cam_r100", "cam_r8"], ["use_beginner", "use_portrait"]),
    ("lens_n35f18", "NIKKOR Z 35mm f/1.8 S", "brand_nikon", "尼康", 5499, 370, "35mm", "f/1.8", "尼康Z卡口", "定焦", "全画幅", "无", "街拍人文定焦", ["cam_z6m3", "cam_zf"], ["use_street", "use_portrait"]),
    ("lens_n85f18", "NIKKOR Z 85mm f/1.8 S", "brand_nikon", "尼康", 5999, 470, "85mm", "f/1.8", "尼康Z卡口", "定焦", "全画幅", "无", "人像定焦", ["cam_z6m3", "cam_z8"], ["use_portrait"]),
    ("lens_n1430", "NIKKOR Z 14-30mm f/4 S", "brand_nikon", "尼康", 7999, 485, "14-30mm", "f/4", "尼康Z卡口", "广角变焦", "全画幅", "无", "风光超广角变焦", ["cam_z8", "cam_z7m2"], ["use_landscape"]),
    ("lens_n24120", "NIKKOR Z 24-120mm f/4 S", "brand_nikon", "尼康", 7999, 630, "24-120mm", "f/4", "尼康Z卡口", "标准变焦", "全画幅", "无", "旅行全能标准变焦", ["cam_z6m3", "cam_z8", "cam_zf"], ["use_travel", "use_portrait"]),
    ("lens_n180600", "NIKKOR Z 180-600mm f/5.6-6.3 VR", "brand_nikon", "尼康", 12999, 1955, "180-600mm", "f/5.6-6.3", "尼康Z卡口", "超长焦变焦", "全画幅", "VR", "生态体育热门长焦", ["cam_z8", "cam_z9"], ["use_sports"]),
    ("lens_n40f2", "NIKKOR Z 40mm f/2", "brand_nikon", "尼康", 1799, 170, "40mm", "f/2", "尼康Z卡口", "定焦", "全画幅", "无", "轻便街拍定焦", ["cam_zf", "cam_z5"], ["use_street", "use_beginner"]),
    ("lens_f23f2", "XF 23mm F2 R WR", "brand_fuji", "富士", 2999, 180, "23mm", "F2", "富士X卡口", "定焦", "APS-C", "无", "街拍人文定焦", ["cam_xt5", "cam_xm5", "cam_xs20"], ["use_street"]),
    ("lens_f35f2", "XF 35mm F2 R WR", "brand_fuji", "富士", 2799, 170, "35mm", "F2", "富士X卡口", "定焦", "APS-C", "无", "小巧人像街拍定焦", ["cam_xt5", "cam_xm5", "cam_xs20"], ["use_street", "use_portrait"]),
    ("lens_f56f12", "XF 56mm F1.2 R WR", "brand_fuji", "富士", 6999, 445, "56mm", "F1.2", "富士X卡口", "定焦", "APS-C", "无", "富士高端人像定焦", ["cam_xt5", "cam_xs20"], ["use_portrait"]),
    ("lens_f1024", "XF 10-24mm F4 R OIS WR", "brand_fuji", "富士", 6999, 385, "10-24mm", "F4", "富士X卡口", "广角变焦", "APS-C", "OIS", "风光旅行广角", ["cam_xt5", "cam_xt50"], ["use_landscape", "use_travel"]),
    ("lens_f50140", "XF 50-140mm F2.8 R LM OIS WR", "brand_fuji", "富士", 8999, 995, "50-140mm", "F2.8", "富士X卡口", "长焦变焦", "APS-C", "OIS", "人像活动长焦", ["cam_xt5", "cam_xh2s"], ["use_portrait", "use_sports"]),
    ("lens_p2470", "Lumix S Pro 24-70mm F2.8", "brand_panasonic", "松下", 12999, 935, "24-70mm", "F2.8", "L卡口", "标准变焦", "全画幅", "无", "松下全画幅大三元", ["cam_s5m2", "cam_s9"], ["use_video", "use_portrait"]),
    ("lens_p70200", "Lumix S Pro 70-200mm F2.8 OIS", "brand_panasonic", "松下", 16999, 1570, "70-200mm", "F2.8", "L卡口", "长焦变焦", "全画幅", "OIS", "全画幅长焦大三元", ["cam_s5m2", "cam_s1h"], ["use_portrait", "use_sports"]),
    ("lens_p1260", "Lumix G 12-60mm F2.8-4 OIS", "brand_panasonic", "松下", 4999, 320, "12-60mm", "F2.8-4", "松下M43卡口", "标准变焦", "M43", "OIS", "M43旅行变焦", ["cam_gh7", "cam_g100d"], ["use_travel", "use_video"]),
    ("lens_om40150", "M.Zuiko 40-150mm F2.8 PRO", "brand_om", "OM System", 8999, 760, "40-150mm", "F2.8", "M43卡口", "长焦变焦", "M43", "无", "M43生态运动长焦", ["cam_om1m2", "cam_om5"], ["use_sports"]),
    ("lens_om300f4", "M.Zuiko 300mm F4 IS PRO", "brand_om", "OM System", 18999, 1270, "300mm", "F4", "M43卡口", "超长焦定焦", "M43", "IS", "轻量生态打鸟定焦", ["cam_om1m2"], ["use_sports"]),
    ("lens_lux28", "Summilux 28mm F1.7 ASPH", "brand_leica", "徕卡", 0, 0, "28mm", "F1.7", "固定镜头", "固定镜头", "全画幅", "无", "徕卡Q系列固定镜头", ["cam_q3", "cam_q2"], ["use_street", "use_travel"]),
    ("lens_h_xcd45p", "XCD 45mm F4 P", "brand_hasselblad", "哈苏", 8999, 320, "45mm", "F4", "哈苏XCD卡口", "定焦", "中画幅", "无", "哈苏轻便中画幅标准定焦", ["cam_x2d", "cam_x1d2"], ["use_studio", "use_landscape"]),
]


def main() -> None:
    rows = []
    rels = []
    for idx, (lens_id, name, brand_id, brand, price, weight, focal, aperture, mount, lens_type, coverage, stabilization, note, cameras, uses) in enumerate(LENSES, 1):
        rows.append(
            {
                "id": lens_id,
                "name": name,
                "Label": "Lens",
                "brand": brand,
                "price": price,
                "weight": weight,
                "focalLength": focal,
                "maxAperture": aperture,
                "mount": mount,
                "lensType": lens_type,
                "coverage": coverage,
                "stabilization": stabilization,
                "marketHotScore": max(60, 96 - idx),
                "sourcePlatform": "市场热销镜头扩容",
                "marketNote": note,
            }
        )
        rels.append({"from_id": lens_id, "to_id": brand_id, "type": "PRODUCED_BY", "score": "", "note": ""})
        for cam in cameras:
            rels.append({"from_id": cam, "to_id": lens_id, "type": "COMPATIBLE_WITH", "score": "", "note": "市场热销镜头适配"})
        for use in uses:
            rels.append({"from_id": lens_id, "to_id": use, "type": "LENS_SUITABLE_FOR", "score": 88, "note": note})

    with CSV_OUT.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)
    with REL_OUT.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["from_id", "to_id", "type", "score", "note"])
        writer.writeheader()
        writer.writerows(rels)

    driver = GraphDatabase.driver(URI, auth=AUTH)
    with driver.session(database="neo4j") as s:
        for row in rows:
            s.run(
                """
                MERGE (n:Entity {id:$id})
                SET n:Lens,
                    n.name=$name,
                    n.brand=$brand,
                    n.price=$price,
                    n.weight=$weight,
                    n.focalLength=$focalLength,
                    n.maxAperture=$maxAperture,
                    n.mount=$mount,
                    n.lensType=$lensType,
                    n.coverage=$coverage,
                    n.stabilization=$stabilization,
                    n.marketHotScore=$marketHotScore,
                    n.sourcePlatform=$sourcePlatform,
                    n.marketNote=$marketNote
                """,
                **row,
            ).consume()
        for rel in rels:
            q = f"""
                MATCH (a:Entity {{id:$from_id}}), (b:Entity {{id:$to_id}})
                MERGE (a)-[r:{rel['type']}]->(b)
                SET r.note=$note
            """
            s.run(q, from_id=rel["from_id"], to_id=rel["to_id"], note=rel["note"]).consume()
            if rel["score"] != "":
                s.run(
                    f"MATCH (:Entity {{id:$from_id}})-[r:{rel['type']}]->(:Entity {{id:$to_id}}) SET r.score=$score",
                    from_id=rel["from_id"],
                    to_id=rel["to_id"],
                    score=int(rel["score"]),
                ).consume()
        print("Lens", s.run("MATCH (n:Lens) RETURN count(n) AS c").single()["c"])
        print("Entity", s.run("MATCH (n:Entity) RETURN count(n) AS c").single()["c"])
        print("Relations", s.run("MATCH (:Entity)-[r]->(:Entity) RETURN count(r) AS c").single()["c"])
    driver.close()
    print(CSV_OUT)
    print(REL_OUT)


if __name__ == "__main__":
    main()
