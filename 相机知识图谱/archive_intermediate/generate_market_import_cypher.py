from __future__ import annotations

import csv
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent
OUT = BASE_DIR / "market_import.cypher"


REL_TYPES = {
    "producedBy": "PRODUCED_BY",
    "belongsToCategory": "BELONGS_TO_CATEGORY",
    "compatibleWith": "COMPATIBLE_WITH",
    "equippedWith": "EQUIPPED_WITH",
    "achievesIndex": "ACHIEVES_INDEX",
    "successorOf": "SUCCESSOR_OF",
    "suitableFor": "SUITABLE_FOR",
    "hasReason": "HAS_REASON",
}


def esc(value: str) -> str:
    return value.replace("\\", "\\\\").replace("'", "\\'")


def is_number(value: str) -> bool:
    if not value:
        return False
    try:
        float(value)
        return True
    except ValueError:
        return False


def prop_set(alias: str, key: str, value: str) -> str | None:
    value = (value or "").strip()
    if not value:
        return None
    if is_number(value):
        if "." in value:
            return f"SET {alias}.{key} = {float(value)}"
        return f"SET {alias}.{key} = {int(float(value))}"
    return f"SET {alias}.{key} = '{esc(value)}'"


def read_rows(name: str) -> list[dict[str, str]]:
    with (BASE_DIR / name).open("r", encoding="utf-8-sig", newline="") as f:
        return list(csv.DictReader(f))


def node_lines(row: dict[str, str]) -> list[str]:
    node_id = esc(row["id"])
    label = row["Label"].strip()
    lines = [f"MERGE (n:Entity {{id: '{node_id}'}})", f"SET n:{label}"]
    for key, value in row.items():
        if key in {"id", "Label"}:
            continue
        line = prop_set("n", key, value)
        if line:
            lines.append(line)
    lines.append(";")
    return lines


def relation_lines(row: dict[str, str]) -> list[str]:
    from_id = esc(row["from_id"])
    to_id = esc(row["to_id"])
    rel_type = REL_TYPES.get(row["type"], row["type"].upper())
    lines = [
        f"MATCH (a:Entity {{id: '{from_id}'}}), (b:Entity {{id: '{to_id}'}})",
        f"MERGE (a)-[r:{rel_type}]->(b)",
    ]
    for key, value in row.items():
        if key in {"from_id", "to_id", "type"}:
            continue
        line = prop_set("r", key, value)
        if line:
            lines.append(line)
    lines.append(";")
    return lines


def main() -> None:
    lines: list[str] = [
        "// Incremental market data import for camera knowledge graph",
        "CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;",
        "",
    ]
    for filename in ["market_camera_nodes.csv", "market_lens_nodes.csv"]:
        for row in read_rows(filename):
            lines.extend(node_lines(row))
            lines.append("")
    for row in read_rows("market_relations.csv"):
        lines.extend(relation_lines(row))
        lines.append("")
    lines.extend(
        [
            "// Refresh price-band relations for all camera models.",
            "MATCH (m:CameraModel), (b:PriceBand)",
            "WHERE m.price >= b.minBudget AND m.price < b.maxBudget",
            "MERGE (m)-[:IN_PRICE_BAND]->(b);",
            "",
            "MATCH (n:Entity) RETURN labels(n) AS labels, count(*) AS count ORDER BY count DESC;",
        ]
    )
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(OUT)


if __name__ == "__main__":
    main()
