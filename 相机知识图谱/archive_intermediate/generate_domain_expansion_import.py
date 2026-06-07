from __future__ import annotations

import csv
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent
OUT = BASE_DIR / "domain_expansion_import.cypher"

REL_TYPES = {
    "suitableFor": "SUITABLE_FOR",
    "recommendedCamera": "RECOMMENDED_CAMERA",
    "priceOf": "PRICE_OF",
    "reviewOf": "REVIEW_OF",
}


def esc(value: str) -> str:
    return (value or "").replace("\\", "\\\\").replace("'", "\\'").replace(";", "；")


def is_num(value: str) -> bool:
    try:
        float(value)
        return value != ""
    except Exception:
        return False


def set_line(alias: str, key: str, value: str) -> str | None:
    if key is None:
        return None
    if isinstance(value, list):
        value = ",".join(v for v in value if v)
    value = (value or "").strip()
    if not value:
        return None
    if is_num(value):
        n = float(value)
        return f"SET {alias}.{key} = {int(n) if n.is_integer() else n}"
    return f"SET {alias}.{key} = '{esc(value)}'"


def rows(name: str) -> list[dict[str, str]]:
    with (BASE_DIR / name).open("r", encoding="utf-8-sig", newline="") as f:
        return list(csv.DictReader(f))


def main() -> None:
    lines = [
        "// Domain expansion import: prices, use cases, profiles, reviews, specs",
        "CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;",
        "",
    ]

    for row in rows("domain_expansion_nodes.csv"):
        lines.append(f"MERGE (n:Entity {{id: '{esc(row['id'])}'}})")
        lines.append(f"SET n:{row['Label']}")
        for key, value in row.items():
            if key in {"id", "Label"}:
                continue
            line = set_line("n", key, value)
            if line:
                lines.append(line)
        lines.append(";\n")

    for row in rows("domain_expansion_relations.csv"):
        rel = REL_TYPES[row["type"]]
        lines.append(f"MATCH (a:Entity {{id: '{esc(row['from_id'])}'}}), (b:Entity {{id: '{esc(row['to_id'])}'}})")
        lines.append(f"MERGE (a)-[r:{rel}]->(b)")
        for key, value in row.items():
            if key in {"from_id", "to_id", "type"}:
                continue
            line = set_line("r", key, value)
            if line:
                lines.append(line)
        lines.append(";\n")

    for row in rows("camera_specs_update.csv"):
        lines.append(f"MATCH (n:Entity {{id: '{esc(row['id'])}'}})")
        for key, value in row.items():
            if key == "id":
                continue
            line = set_line("n", key, value)
            if line:
                lines.append(line)
        lines.append(";\n")

    for row in rows("lens_specs_update.csv"):
        lines.append(f"MATCH (n:Entity {{id: '{esc(row['id'])}'}})")
        for key, value in row.items():
            if key == "id":
                continue
            line = set_line("n", key, value)
            if line:
                lines.append(line)
        lines.append(";\n")

    lines.extend(
        [
            "MATCH (n:PriceRecord) RETURN count(n) AS 价格记录数;",
            "MATCH (n:ReviewRecord) RETURN count(n) AS 评测记录数;",
            "MATCH (n:UserProfile) RETURN count(n) AS 用户画像数;",
        ]
    )
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(OUT)


if __name__ == "__main__":
    main()
