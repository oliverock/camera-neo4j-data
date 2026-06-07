from __future__ import annotations

import csv
from pathlib import Path

from neo4j import GraphDatabase


BASE_DIR = Path(__file__).resolve().parent
CSV_OUT = BASE_DIR / "brand_15_models.csv"
REL_OUT = BASE_DIR / "brand_15_model_relations.csv"

NEO4J_URI = "neo4j://127.0.0.1:7687"
NEO4J_USER = "neo4j"
NEO4J_PASSWORD = "123456789"


BRANDS = {
    "brand_sony": "索尼",
    "brand_canon": "佳能",
    "brand_nikon": "尼康",
    "brand_fuji": "富士",
    "brand_panasonic": "松下",
    "brand_leica": "徕卡",
    "brand_om": "OM System",
    "brand_ricoh": "理光",
    "brand_hasselblad": "哈苏",
    "brand_dji": "大疆",
}

CATEGORY_LABELS = {
    "cat_ff": "全画幅微单",
    "cat_apsc": "APS-C画幅微单",
    "cat_mf": "中画幅微单",
    "cat_m43": "M43微单",
    "cat_compact": "便携固定镜头相机",
    "cat_vlog_compact": "Vlog便携相机",
}


MODELS = {
    "brand_sony": [
        ("cam_a1", "Alpha 1", "cat_ff", 47999, 2021, 737, 5010, 5.5, 759, "use_professional", "reason_fast"),
        ("cam_a7s3", "Alpha 7S III", "cat_ff", 23999, 2020, 699, 1210, 5.5, 759, "use_video", "reason_video"),
        ("cam_zv1m2", "ZV-1 II", "cat_vlog_compact", 5499, 2023, 292, 2010, 0, 315, "use_video", "reason_light"),
    ],
    "brand_canon": [
        ("cam_r5", "EOS R5", "cat_ff", 21999, 2020, 738, 4500, 8, 1053, "use_landscape", "reason_full_frame"),
        ("cam_r10_old", "EOS R10", "cat_apsc", 6799, 2022, 429, 2420, 0, 651, "use_beginner", "reason_fast"),
        ("cam_r8_dup", "EOS R8", "cat_ff", 10499, 2023, 461, 2420, 0, 1053, "use_portrait", "reason_full_frame"),
        ("cam_r5c", "EOS R5 C", "cat_ff", 26999, 2022, 770, 4500, 0, 1053, "use_video", "reason_video"),
        ("cam_r1", "EOS R1", "cat_ff", 45999, 2024, 920, 2420, 8.5, 1053, "use_sports", "reason_fast"),
    ],
    "brand_nikon": [
        ("cam_z7m2", "Z 7II", "cat_ff", 14999, 2020, 705, 4575, 5, 493, "use_landscape", "reason_full_frame"),
        ("cam_z5", "Z 5", "cat_ff", 7999, 2020, 675, 2430, 5, 273, "use_beginner", "reason_full_frame"),
        ("cam_z30_new", "Z 30", "cat_apsc", 4999, 2022, 405, 2088, 0, 209, "use_video", "reason_video"),
        ("cam_zfc", "Z fc", "cat_apsc", 6999, 2021, 445, 2088, 0, 209, "use_street", "reason_light"),
        ("cam_z7", "Z 7", "cat_ff", 9999, 2018, 675, 4575, 5, 493, "use_landscape", "reason_full_frame"),
        ("cam_z6m2", "Z 6II", "cat_ff", 9999, 2020, 705, 2450, 5, 273, "use_portrait", "reason_full_frame"),
        ("cam_z6", "Z 6", "cat_ff", 7999, 2018, 675, 2450, 5, 273, "use_portrait", "reason_full_frame"),
    ],
    "brand_fuji": [
        ("cam_xh2", "X-H2", "cat_apsc", 13999, 2022, 660, 4020, 7, 425, "use_landscape", "reason_video"),
        ("cam_xpro3", "X-Pro3", "cat_apsc", 12999, 2019, 497, 2610, 0, 425, "use_street", "reason_light"),
        ("cam_xt4", "X-T4", "cat_apsc", 8999, 2020, 607, 2610, 6.5, 425, "use_video", "reason_video"),
        ("cam_xt3", "X-T3", "cat_apsc", 5999, 2018, 539, 2610, 0, 425, "use_street", "reason_low_cost"),
        ("cam_gfx50s2", "GFX 50S II", "cat_mf", 24999, 2021, 900, 5140, 6.5, 425, "use_studio", "reason_full_frame"),
        ("cam_gfx100s", "GFX100S", "cat_mf", 39999, 2021, 900, 10200, 6, 425, "use_studio", "reason_full_frame"),
    ],
    "brand_panasonic": [
        ("cam_s1", "Lumix S1", "cat_ff", 10999, 2019, 1021, 2420, 6, 225, "use_portrait", "reason_full_frame"),
        ("cam_s1r", "Lumix S1R", "cat_ff", 16999, 2019, 1020, 4730, 6, 225, "use_landscape", "reason_full_frame"),
        ("cam_s1h", "Lumix S1H", "cat_ff", 21999, 2019, 1164, 2420, 6, 225, "use_video", "reason_video"),
        ("cam_s5", "Lumix S5", "cat_ff", 7999, 2020, 714, 2420, 6.5, 225, "use_video", "reason_video"),
        ("cam_s5m2x", "Lumix S5 IIX", "cat_ff", 13999, 2023, 740, 2420, 6.5, 779, "use_video", "reason_video"),
        ("cam_g9m2", "Lumix G9 II", "cat_m43", 11999, 2023, 658, 2520, 8, 779, "use_sports", "reason_fast"),
        ("cam_gh6", "Lumix GH6", "cat_m43", 9999, 2022, 823, 2520, 7.5, 315, "use_video", "reason_video"),
        ("cam_gh5m2", "Lumix GH5 II", "cat_m43", 7999, 2021, 727, 2030, 6.5, 225, "use_video", "reason_video"),
        ("cam_g95", "Lumix G95", "cat_m43", 4999, 2019, 536, 2030, 5, 49, "use_beginner", "reason_low_cost"),
        ("cam_gx9", "Lumix GX9", "cat_m43", 3999, 2018, 450, 2030, 4, 49, "use_street", "reason_light"),
        ("cam_lx100m2", "Lumix LX100 II", "cat_compact", 5999, 2018, 392, 1700, 0, 49, "use_street", "reason_light"),
    ],
    "brand_leica": [
        ("cam_m11", "M11", "cat_compact", 68000, 2022, 530, 6030, 0, 0, "use_street", "reason_full_frame"),
        ("cam_m11p", "M11-P", "cat_compact", 72000, 2023, 530, 6030, 0, 0, "use_street", "reason_full_frame"),
        ("cam_m11m", "M11 Monochrom", "cat_compact", 78000, 2023, 540, 6030, 0, 0, "use_street", "reason_full_frame"),
        ("cam_q2", "Q2", "cat_compact", 33900, 2019, 734, 4730, 0, 225, "use_travel", "reason_full_frame"),
        ("cam_sl2", "SL2", "cat_ff", 38900, 2019, 835, 4730, 5.5, 225, "use_studio", "reason_full_frame"),
        ("cam_sl2s", "SL2-S", "cat_ff", 32900, 2020, 850, 2420, 5.5, 225, "use_video", "reason_video"),
        ("cam_sl3", "SL3", "cat_ff", 54800, 2024, 769, 6030, 5, 779, "use_landscape", "reason_full_frame"),
        ("cam_cl", "CL", "cat_apsc", 14999, 2017, 403, 2420, 0, 49, "use_travel", "reason_light"),
        ("cam_tl2", "TL2", "cat_apsc", 9999, 2017, 399, 2420, 0, 49, "use_street", "reason_light"),
        ("cam_dlux7", "D-LUX 7", "cat_compact", 8999, 2018, 403, 1700, 0, 49, "use_travel", "reason_light"),
        ("cam_vlux5", "V-LUX 5", "cat_compact", 9999, 2019, 812, 2010, 0, 49, "use_travel", "reason_lens_ecosystem"),
        ("cam_sofort2", "Sofort 2", "cat_compact", 2999, 2023, 320, 500, 0, 0, "use_beginner", "reason_light"),
        ("cam_m10r", "M10-R", "cat_compact", 52000, 2020, 660, 4000, 0, 0, "use_street", "reason_full_frame"),
    ],
    "brand_om": [
        ("cam_em1m3", "E-M1 Mark III", "cat_m43", 8999, 2020, 580, 2040, 7.5, 121, "use_sports", "reason_fast"),
        ("cam_em1x", "E-M1X", "cat_m43", 12999, 2019, 997, 2040, 7.5, 121, "use_sports", "reason_fast"),
        ("cam_em5m3", "E-M5 Mark III", "cat_m43", 5999, 2019, 414, 2040, 5.5, 121, "use_travel", "reason_light"),
        ("cam_em10m4", "E-M10 Mark IV", "cat_m43", 4999, 2020, 383, 2030, 4.5, 121, "use_beginner", "reason_light"),
        ("cam_penf", "PEN-F", "cat_m43", 7999, 2016, 427, 2030, 5, 81, "use_street", "reason_light"),
        ("cam_epl10", "E-PL10", "cat_m43", 3999, 2019, 380, 1600, 3.5, 121, "use_beginner", "reason_low_cost"),
        ("cam_tg7", "TG-7", "cat_compact", 3999, 2023, 249, 1200, 0, 25, "use_travel", "reason_light"),
        ("cam_tg6", "TG-6", "cat_compact", 2999, 2019, 253, 1200, 0, 25, "use_travel", "reason_light"),
        ("cam_om1", "OM-1", "cat_m43", 12999, 2022, 599, 2040, 8, 1053, "use_sports", "reason_fast"),
        ("cam_em1m2", "E-M1 Mark II", "cat_m43", 5999, 2016, 574, 2040, 5.5, 121, "use_sports", "reason_fast"),
        ("cam_em5m2", "E-M5 Mark II", "cat_m43", 3999, 2015, 469, 1600, 5, 81, "use_travel", "reason_light"),
        ("cam_epl9", "E-PL9", "cat_m43", 2999, 2018, 380, 1600, 3.5, 121, "use_beginner", "reason_low_cost"),
        ("cam_air_a01", "Air A01", "cat_m43", 1999, 2015, 147, 1600, 0, 81, "use_beginner", "reason_light"),
    ],
    "brand_ricoh": [
        ("cam_gr2", "GR II", "cat_compact", 3999, 2015, 251, 1620, 0, 0, "use_street", "reason_light"),
        ("cam_griiihdf", "GR III HDF", "cat_compact", 7999, 2024, 257, 2420, 3, 0, "use_street", "reason_light"),
        ("cam_gr3xhdf", "GR IIIx HDF", "cat_compact", 8499, 2024, 262, 2420, 3, 0, "use_street", "reason_light"),
        ("cam_gr3street", "GR III Street Edition", "cat_compact", 7999, 2020, 257, 2420, 3, 0, "use_street", "reason_light"),
        ("cam_gr3xurban", "GR IIIx Urban Edition", "cat_compact", 8499, 2022, 262, 2420, 3, 0, "use_street", "reason_light"),
        ("cam_gr", "GR", "cat_compact", 2999, 2013, 245, 1620, 0, 0, "use_street", "reason_light"),
        ("cam_gxr", "GXR", "cat_compact", 1999, 2009, 370, 1200, 0, 0, "use_street", "reason_light"),
        ("cam_wg8", "WG-8", "cat_compact", 2999, 2024, 242, 2000, 0, 9, "use_travel", "reason_light"),
        ("cam_wg7", "WG-7", "cat_compact", 2499, 2021, 246, 2000, 0, 9, "use_travel", "reason_light"),
        ("cam_wg6", "WG-6", "cat_compact", 1999, 2019, 246, 2000, 0, 9, "use_travel", "reason_light"),
        ("cam_theta_z1", "Theta Z1", "cat_vlog_compact", 6999, 2019, 182, 2300, 0, 0, "use_video", "reason_light"),
        ("cam_theta_x", "Theta X", "cat_vlog_compact", 5999, 2022, 170, 6000, 0, 0, "use_video", "reason_light"),
        ("cam_theta_sc2", "Theta SC2", "cat_vlog_compact", 1999, 2019, 104, 1400, 0, 0, "use_video", "reason_low_cost"),
    ],
    "brand_hasselblad": [
        ("cam_x1d", "X1D", "cat_mf", 29999, 2016, 725, 5000, 0, 117, "use_studio", "reason_full_frame"),
        ("cam_x1d2", "X1D II 50C", "cat_mf", 39999, 2019, 766, 5000, 0, 117, "use_studio", "reason_full_frame"),
        ("cam_907x50c", "907X 50C", "cat_mf", 49999, 2020, 740, 5000, 0, 117, "use_studio", "reason_full_frame"),
        ("cam_907x100c", "907X & CFV 100C", "cat_mf", 59999, 2024, 620, 10000, 0, 294, "use_studio", "reason_full_frame"),
        ("cam_h6d100c", "H6D-100c", "cat_mf", 239999, 2016, 2130, 10000, 0, 0, "use_studio", "reason_full_frame"),
        ("cam_h6d50c", "H6D-50c", "cat_mf", 159999, 2016, 2130, 5000, 0, 0, "use_studio", "reason_full_frame"),
        ("cam_h5d50c", "H5D-50c", "cat_mf", 99999, 2014, 2290, 5000, 0, 0, "use_studio", "reason_full_frame"),
        ("cam_h4d40", "H4D-40", "cat_mf", 59999, 2010, 2290, 4000, 0, 0, "use_studio", "reason_full_frame"),
        ("cam_lunar", "Lunar", "cat_apsc", 29999, 2013, 411, 2430, 0, 25, "use_travel", "reason_light"),
        ("cam_stellar", "Stellar", "cat_compact", 14999, 2013, 240, 2020, 0, 25, "use_travel", "reason_light"),
        ("cam_hv", "HV", "cat_ff", 59999, 2014, 733, 2430, 0, 25, "use_portrait", "reason_full_frame"),
        ("cam_500cm", "500 C/M", "cat_mf", 39999, 1970, 1500, 0, 0, 0, "use_studio", "reason_full_frame"),
        ("cam_503cw", "503CW", "cat_mf", 49999, 1996, 1600, 0, 0, 0, "use_studio", "reason_full_frame"),
        ("cam_arcbody", "ArcBody", "cat_mf", 59999, 1997, 1200, 0, 0, 0, "use_landscape", "reason_full_frame"),
    ],
    "brand_dji": [
        ("cam_action5pro", "Osmo Action 5 Pro", "cat_vlog_compact", 2999, 2024, 146, 4000, 0, 0, "use_video", "reason_light"),
        ("cam_action4", "Osmo Action 4", "cat_vlog_compact", 2499, 2023, 145, 1200, 0, 0, "use_video", "reason_light"),
        ("cam_action3", "Osmo Action 3", "cat_vlog_compact", 1999, 2022, 145, 1200, 0, 0, "use_video", "reason_low_cost"),
        ("cam_pocket2", "Osmo Pocket 2", "cat_vlog_compact", 2499, 2020, 117, 6400, 0, 0, "use_video", "reason_light"),
        ("cam_osmo_action", "Osmo Action", "cat_vlog_compact", 1299, 2019, 134, 1200, 0, 0, "use_video", "reason_low_cost"),
        ("cam_mavic3pro", "Mavic 3 Pro", "cat_vlog_compact", 13888, 2023, 958, 2000, 0, 0, "use_video", "reason_video"),
        ("cam_mavic3classic", "Mavic 3 Classic", "cat_vlog_compact", 9288, 2022, 895, 2000, 0, 0, "use_video", "reason_video"),
        ("cam_air3", "Air 3", "cat_vlog_compact", 6988, 2023, 720, 4800, 0, 0, "use_video", "reason_video"),
        ("cam_air3s", "Air 3S", "cat_vlog_compact", 6988, 2024, 724, 5000, 0, 0, "use_video", "reason_video"),
        ("cam_mini4pro", "Mini 4 Pro", "cat_vlog_compact", 4788, 2023, 249, 4800, 0, 0, "use_travel", "reason_light"),
        ("cam_mini3pro", "Mini 3 Pro", "cat_vlog_compact", 3988, 2022, 249, 4800, 0, 0, "use_travel", "reason_light"),
        ("cam_avata2", "Avata 2", "cat_vlog_compact", 5988, 2024, 377, 1200, 0, 0, "use_video", "reason_video"),
        ("cam_inspire3", "Inspire 3", "cat_vlog_compact", 79888, 2023, 3995, 8000, 0, 0, "use_professional", "reason_video"),
        ("cam_rs3pro", "Ronin 4D", "cat_vlog_compact", 46888, 2021, 4670, 6000, 0, 0, "use_professional", "reason_video"),
    ],
}


def main() -> None:
    rows = []
    rels = []
    for brand_id, models in MODELS.items():
        brand = BRANDS[brand_id]
        for idx, (node_id, name, cat_id, price, year, weight, pixels, ibis, af, use_id, reason_id) in enumerate(models, 1):
            hot = max(55, 92 - idx)
            category = CATEGORY_LABELS[cat_id]
            rows.append(
                {
                    "id": node_id,
                    "name": name,
                    "Label": "CameraModel",
                    "brand": brand,
                    "category": category,
                    "price": price,
                    "releaseYear": year,
                    "weight": weight,
                    "effectivePixels": pixels,
                    "ibisStops": ibis,
                    "afPoints": af,
                    "batteryShots": 420 if year >= 2020 else 300,
                    "cardSlots": 2 if price >= 12000 else 1,
                    "screenType": "翻折触控屏" if use_id in {"use_video", "use_live"} else "触控屏",
                    "videoBitrate": "200Mbps" if use_id in {"use_video", "use_professional"} else "",
                    "mount": category,
                    "marketHotScore": hot,
                    "sourcePlatform": "品牌型号扩容",
                    "marketNote": f"{brand}热门/代表型号，适合{use_id.replace('use_', '')}场景",
                }
            )
            rels.extend(
                [
                    {"from_id": node_id, "to_id": brand_id, "type": "PRODUCED_BY", "score": "", "note": ""},
                    {"from_id": node_id, "to_id": cat_id, "type": "BELONGS_TO_CATEGORY", "score": "", "note": ""},
                    {"from_id": node_id, "to_id": use_id, "type": "SUITABLE_FOR", "score": min(96, hot + 5), "note": "按品牌代表型号补充的用途关系"},
                    {"from_id": node_id, "to_id": reason_id, "type": "HAS_REASON", "score": "", "note": ""},
                ]
            )

    with CSV_OUT.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)
    with REL_OUT.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["from_id", "to_id", "type", "score", "note"])
        writer.writeheader()
        writer.writerows(rels)

    driver = GraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, NEO4J_PASSWORD))
    with driver.session(database="neo4j") as s:
        for row in rows:
            s.run(
                """
                MERGE (n:Entity {id:$id})
                SET n:CameraModel,
                    n.name=$name,
                    n.brand=$brand,
                    n.category=$category,
                    n.price=$price,
                    n.releaseYear=$releaseYear,
                    n.weight=$weight,
                    n.effectivePixels=$effectivePixels,
                    n.ibisStops=$ibisStops,
                    n.afPoints=$afPoints,
                    n.batteryShots=$batteryShots,
                    n.cardSlots=$cardSlots,
                    n.screenType=$screenType,
                    n.videoBitrate=$videoBitrate,
                    n.mount=$mount,
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
            params = {"from_id": rel["from_id"], "to_id": rel["to_id"], "note": rel["note"]}
            s.run(q, params).consume()
            if rel["score"] != "":
                s.run(
                    f"MATCH (:Entity {{id:$from_id}})-[r:{rel['type']}]->(:Entity {{id:$to_id}}) SET r.score=$score",
                    from_id=rel["from_id"],
                    to_id=rel["to_id"],
                    score=int(rel["score"]),
                ).consume()
        s.run(
            """
            MATCH (m:CameraModel), (b:PriceBand)
            WHERE m.price >= b.minBudget AND m.price < b.maxBudget
            MERGE (m)-[:IN_PRICE_BAND]->(b)
            """
        ).consume()
        result = s.run(
            """
            MATCH (m:CameraModel)-[:PRODUCED_BY]->(b:Brand)
            RETURN b.id AS brandId, b.name AS brand, count(DISTINCT m) AS count
            ORDER BY brandId
            """
        )
        for record in result:
            print(record.data())
        print("added_models", len(rows))
    driver.close()
    print(CSV_OUT)
    print(REL_OUT)


if __name__ == "__main__":
    main()
