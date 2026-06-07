$ErrorActionPreference = "Stop"

function Escape-Cypher([string]$s) {
  if ($null -eq $s) { return "" }
  return $s.Replace("\", "\\").Replace("'", "\'")
}

function Is-Number([string]$s) {
  if ([string]::IsNullOrWhiteSpace($s)) { return $false }
  $v = 0.0
  return [double]::TryParse($s, [ref]$v)
}

function Prop-Line([string]$name, [string]$value) {
  if ([string]::IsNullOrWhiteSpace($value)) { return $null }
  if (Is-Number $value) { return "SET n.$name = $value" }
  return "SET n.$name = '$(Escape-Cypher $value)'"
}

function Rel-Type([string]$type) {
  switch ($type) {
    "producedBy" { return "PRODUCED_BY" }
    "belongsToCategory" { return "BELONGS_TO_CATEGORY" }
    "compatibleWith" { return "COMPATIBLE_WITH" }
    "equippedWith" { return "EQUIPPED_WITH" }
    "achievesIndex" { return "ACHIEVES_INDEX" }
    "successorOf" { return "SUCCESSOR_OF" }
    "suitableFor" { return "SUITABLE_FOR" }
    "hasReason" { return "HAS_REASON" }
    default { return $type.ToUpperInvariant() }
  }
}

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$out = Join-Path $root "camera_graph_import.cypher"
$lines = New-Object System.Collections.Generic.List[string]

$lines.Add("// Camera knowledge graph import script")
$lines.Add("// Run all statements in Neo4j Browser.")
$lines.Add("CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;")
$lines.Add("MATCH (n:Entity) DETACH DELETE n;")
$lines.Add("")

$nodeFiles = @("node.csv", "camera_extra_nodes.csv")
foreach ($file in $nodeFiles) {
  foreach ($row in Import-Csv (Join-Path $root $file) -Encoding UTF8) {
    if ([string]::IsNullOrWhiteSpace($row.id)) { continue }
    $id = Escape-Cypher $row.id
    $label = if ([string]::IsNullOrWhiteSpace($row.Label)) { "Entity" } else { $row.Label.Trim() }
    $lines.Add("MERGE (n:Entity {id: '$id'})")
    $lines.Add("SET n:$label")
    foreach ($p in $row.PSObject.Properties) {
      if ($p.Name -in @("id", "Label")) { continue }
      $pl = Prop-Line $p.Name ([string]$p.Value)
      if ($null -ne $pl) { $lines.Add($pl) }
    }
    $lines.Add(";")
    $lines.Add("")
  }
}

$edgeFiles = @("edges.csv", "camera_extra_edges.csv")
foreach ($file in $edgeFiles) {
  foreach ($row in Import-Csv (Join-Path $root $file) -Encoding UTF8) {
    if ([string]::IsNullOrWhiteSpace($row.from_id) -or [string]::IsNullOrWhiteSpace($row.to_id) -or [string]::IsNullOrWhiteSpace($row.type)) { continue }
    $from = Escape-Cypher $row.from_id
    $to = Escape-Cypher $row.to_id
    $type = Rel-Type $row.type
    $lines.Add("MATCH (a:Entity {id: '$from'}), (b:Entity {id: '$to'})")
    $lines.Add("MERGE (a)-[r:$type]->(b)")
    foreach ($p in $row.PSObject.Properties) {
      if ($p.Name -in @("from_id", "to_id", "type")) { continue }
      if ([string]::IsNullOrWhiteSpace([string]$p.Value)) { continue }
      if (Is-Number ([string]$p.Value)) { $lines.Add("SET r.$($p.Name) = $($p.Value)") }
      else { $lines.Add("SET r.$($p.Name) = '$(Escape-Cypher ([string]$p.Value))'") }
    }
    $lines.Add(";")
    $lines.Add("")
  }
}

$lines.Add("// Create price-band relations from camera price.")
$lines.Add("MATCH (m:CameraModel), (b:PriceBand)")
$lines.Add("WHERE m.price >= b.minBudget AND m.price < b.maxBudget")
$lines.Add("MERGE (m)-[:IN_PRICE_BAND]->(b);")
$lines.Add("")
$lines.Add("// Smoke test")
$lines.Add("MATCH (n:Entity) RETURN labels(n) AS labels, count(*) AS count ORDER BY count DESC;")

$enc = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($out, ($lines -join [Environment]::NewLine), $enc)
Write-Host $out
