param(
  [string]$Root = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

function XmlEscape([string]$s) {
  if ($null -eq $s) { return "" }
  return [System.Security.SecurityElement]::Escape($s)
}

function New-DirClean([string]$path) {
  if (Test-Path $path) { Remove-Item -LiteralPath $path -Recurse -Force }
  New-Item -ItemType Directory -Path $path | Out-Null
}

function Write-Utf8NoBom([string]$path, [string]$content) {
  $enc = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllText($path, $content, $enc)
}

function Add-ZipFromFolder([string]$folder, [string]$zipPath) {
  if (Test-Path $zipPath) { Remove-Item -LiteralPath $zipPath -Force }
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $fullFolder = (Resolve-Path $folder).Path
  [System.IO.Compression.ZipFile]::CreateFromDirectory($fullFolder, $zipPath)
}

function New-DocxFromMarkdown([string]$markdownPath, [string]$docxPath) {
  $tmp = Join-Path $env:TEMP ("kg_docx_" + [Guid]::NewGuid().ToString("N"))
  New-DirClean $tmp
  New-Item -ItemType Directory -Path (Join-Path $tmp "_rels") | Out-Null
  New-Item -ItemType Directory -Path (Join-Path $tmp "word") | Out-Null
  New-Item -ItemType Directory -Path (Join-Path $tmp "word\_rels") | Out-Null

  $paras = New-Object System.Collections.Generic.List[string]
  foreach ($line in Get-Content -LiteralPath $markdownPath -Encoding UTF8) {
    $t = $line.TrimEnd()
    if ($t.Length -eq 0) {
      $paras.Add('<w:p/>')
      continue
    }
    $style = "Normal"
    if ($t.StartsWith("# ")) { $style = "Title"; $t = $t.Substring(2) }
    elseif ($t.StartsWith("## ")) { $style = "Heading1"; $t = $t.Substring(3) }
    elseif ($t.StartsWith("### ")) { $style = "Heading2"; $t = $t.Substring(4) }
    elseif ($t.StartsWith("#### ")) { $style = "Heading3"; $t = $t.Substring(5) }
    elseif ($t.StartsWith("- ")) { $t = "• " + $t.Substring(2) }
    elseif ($t -match "^\d+\. ") { $t = $t }
    $escaped = XmlEscape $t
    $pPr = ""
    if ($style -ne "Normal") { $pPr = "<w:pPr><w:pStyle w:val=`"$style`"/></w:pPr>" }
    $paras.Add("<w:p>$pPr<w:r><w:t xml:space=`"preserve`">$escaped</w:t></w:r></w:p>")
  }

  $documentXml = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    $($paras -join "`n")
    <w:sectPr><w:pgSz w:w="11906" w:h="16838"/><w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"/></w:sectPr>
  </w:body>
</w:document>
"@

  $stylesXml = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:style w:type="paragraph" w:default="1" w:styleId="Normal"><w:name w:val="Normal"/><w:rPr><w:rFonts w:eastAsia="宋体"/><w:sz w:val="21"/></w:rPr></w:style>
  <w:style w:type="paragraph" w:styleId="Title"><w:name w:val="Title"/><w:basedOn w:val="Normal"/><w:pPr><w:jc w:val="center"/></w:pPr><w:rPr><w:b/><w:rFonts w:eastAsia="黑体"/><w:sz w:val="32"/></w:rPr></w:style>
  <w:style w:type="paragraph" w:styleId="Heading1"><w:name w:val="heading 1"/><w:basedOn w:val="Normal"/><w:rPr><w:b/><w:rFonts w:eastAsia="黑体"/><w:sz w:val="28"/></w:rPr></w:style>
  <w:style w:type="paragraph" w:styleId="Heading2"><w:name w:val="heading 2"/><w:basedOn w:val="Normal"/><w:rPr><w:b/><w:rFonts w:eastAsia="黑体"/><w:sz w:val="24"/></w:rPr></w:style>
  <w:style w:type="paragraph" w:styleId="Heading3"><w:name w:val="heading 3"/><w:basedOn w:val="Normal"/><w:rPr><w:b/><w:rFonts w:eastAsia="黑体"/><w:sz w:val="22"/></w:rPr></w:style>
</w:styles>
"@

  Write-Utf8NoBom (Join-Path $tmp "[Content_Types].xml") @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
  <Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>
</Types>
"@
  Write-Utf8NoBom (Join-Path $tmp "_rels\.rels") @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>
"@
  Write-Utf8NoBom (Join-Path $tmp "word\_rels\document.xml.rels") @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"/>
"@
  Write-Utf8NoBom (Join-Path $tmp "word\document.xml") $documentXml
  Write-Utf8NoBom (Join-Path $tmp "word\styles.xml") $stylesXml
  Add-ZipFromFolder $tmp $docxPath
  Remove-Item -LiteralPath $tmp -Recurse -Force
}

function New-Pptx([string]$pptxPath) {
  $slides = @(
    @{Title="面向消费决策的相机领域知识图谱"; Bullets=@("知识图谱期末大作业", "核心维度：品牌、型号、类别、价格", "汇报时长：10 分钟")},
    @{Title="研究背景"; Bullets=@("相机选购参数多、关系复杂、信息来源分散", "品牌、画幅、价格、镜头系统和性能指标需要联合比较", "知识图谱适合组织实体、属性与关系")},
    @{Title="文献综述"; Bullets=@("整理 33 篇相关文献", "方向：图谱基础、信息抽取、嵌入补全、图谱推荐、商品图谱", "结论：图谱可提升结构化表达、可解释推荐和冷启动能力")},
    @{Title="设计目标"; Bullets=@("表达品牌、型号、类别、价格等核心事实", "表达镜头兼容、组件搭载和性能指标", "支持预算筛选、品牌对比、类别查询和关系解释")},
    @{Title="图谱实体"; Bullets=@("Brand：索尼、佳能、尼康、富士", "CameraModel：Alpha 7 IV、EOS R5 Mark II、Z 8、X-T5", "CameraCategory、Lens、Component、ParameterIndex")},
    @{Title="图谱关系"; Bullets=@("producedBy：型号/镜头 -> 品牌", "belongsToCategory：型号 -> 类别", "compatibleWith：机身 -> 镜头", "equippedWith / achievesIndex / successorOf：组件、指标与换代关系")},
    @{Title="数据结构"; Bullets=@("node.csv：id、name、Label、price、releaseYear、weight 等", "edges.csv：from_id、to_id、type", "CSV 便于导入 Neo4j、Gephi 或其他可视化工具")},
    @{Title="典型查询"; Bullets=@("价格 17000 元以内的全画幅微单", "Alpha 7 IV 兼容哪些 FE 镜头", "哪些机型支持 8K30p、4K60p 或高速连拍")},
    @{Title="案例：Alpha 7 IV"; Bullets=@("品牌：索尼；类别：全画幅微单；价格：16999 元", "搭载 BIONZ XR、Exmor R CMOS", "支持 4K60p 和 10fps，可用于解释推荐理由")},
    @{Title="总结与展望"; Bullets=@("已完成文献综述、图谱模式设计和数据结构整理", "后续可加入用途场景、用户画像、评测得分和实时价格", "可扩展为相机智能问答与推荐系统")}
  )

  $tmp = Join-Path $env:TEMP ("kg_pptx_" + [Guid]::NewGuid().ToString("N"))
  New-DirClean $tmp
  New-Item -ItemType Directory -Path (Join-Path $tmp "_rels") | Out-Null
  New-Item -ItemType Directory -Path (Join-Path $tmp "ppt\_rels") | Out-Null
  New-Item -ItemType Directory -Path (Join-Path $tmp "ppt\slides") | Out-Null

  $overrides = @()
  $rels = @()
  for ($i=1; $i -le $slides.Count; $i++) {
    $overrides += "<Override PartName=`"/ppt/slides/slide$i.xml`" ContentType=`"application/vnd.openxmlformats-officedocument.presentationml.slide+xml`"/>"
    $rels += "<Relationship Id=`"rId$i`" Type=`"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide`" Target=`"slides/slide$i.xml`"/>"
  }

  Write-Utf8NoBom (Join-Path $tmp "[Content_Types].xml") @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/ppt/presentation.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml"/>
  $($overrides -join "`n  ")
</Types>
"@
  Write-Utf8NoBom (Join-Path $tmp "_rels\.rels") @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="ppt/presentation.xml"/>
</Relationships>
"@
  Write-Utf8NoBom (Join-Path $tmp "ppt\_rels\presentation.xml.rels") @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  $($rels -join "`n  ")
</Relationships>
"@
  $sldIds = for ($i=1; $i -le $slides.Count; $i++) { "<p:sldId id=`"$([int](255+$i))`" r:id=`"rId$i`"/>" }
  Write-Utf8NoBom (Join-Path $tmp "ppt\presentation.xml") @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:presentation xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:sldIdLst>
    $($sldIds -join "`n    ")
  </p:sldIdLst>
  <p:sldSz cx="12192000" cy="6858000" type="wide"/>
  <p:notesSz cx="6858000" cy="9144000"/>
</p:presentation>
"@

  for ($i=1; $i -le $slides.Count; $i++) {
    $slide = $slides[$i-1]
    $title = XmlEscape $slide.Title
    $bodyRuns = @()
    foreach ($b in $slide.Bullets) {
      $bodyRuns += "<a:p><a:pPr marL=`"342900`" indent=`"-171450`"><a:buChar char=`"•`"/></a:pPr><a:r><a:rPr lang=`"zh-CN`" sz=`"2600`"/><a:t>$(XmlEscape $b)</a:t></a:r></a:p>"
    }
    $slideXml = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld>
    <p:bg><p:bgPr><a:solidFill><a:srgbClr val="F7F8FA"/></a:solidFill></p:bgPr></p:bg>
    <p:spTree>
      <p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>
      <p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>
      <p:sp>
        <p:nvSpPr><p:cNvPr id="2" name="Title"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr><a:xfrm><a:off x="640000" y="420000"/><a:ext cx="10800000" cy="820000"/></a:xfrm></p:spPr>
        <p:txBody><a:bodyPr/><a:lstStyle/><a:p><a:r><a:rPr lang="zh-CN" sz="3800" b="1"><a:solidFill><a:srgbClr val="172033"/></a:solidFill></a:rPr><a:t>$title</a:t></a:r></a:p></p:txBody>
      </p:sp>
      <p:sp>
        <p:nvSpPr><p:cNvPr id="3" name="Body"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>
        <p:spPr><a:xfrm><a:off x="900000" y="1500000"/><a:ext cx="10400000" cy="4700000"/></a:xfrm><a:solidFill><a:srgbClr val="FFFFFF"/></a:solidFill><a:ln><a:srgbClr val="D6DAE0"/></a:ln></p:spPr>
        <p:txBody><a:bodyPr lIns="360000" tIns="300000" rIns="300000" bIns="250000"/><a:lstStyle/>$($bodyRuns -join "")</p:txBody>
      </p:sp>
    </p:spTree>
  </p:cSld>
  <p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr>
</p:sld>
"@
    Write-Utf8NoBom (Join-Path $tmp "ppt\slides\slide$i.xml") $slideXml
  }

  Add-ZipFromFolder $tmp $pptxPath
  Remove-Item -LiteralPath $tmp -Recurse -Force
}

$review = Join-Path $Root "文献综述与知识图谱设计.md"
$docx = Join-Path $Root "文献综述.docx"
$pptx = Join-Path $Root "面向消费决策的相机领域知识图谱设计与实现.pptx"

New-DocxFromMarkdown $review $docx
New-Pptx $pptx

Write-Host "生成完成:"
Write-Host $docx
Write-Host $pptx
