// 参数化导购推荐模板
// 修改下面四个变量即可生成购买建议。
WITH {
  budget: 17000,
  useCase: '视频创作',
  brand: '索尼',
  category: ''
} AS pref
MATCH (m:CameraModel)
OPTIONAL MATCH (m)-[:PRODUCED_BY]->(b:Brand)
OPTIONAL MATCH (m)-[:BELONGS_TO_CATEGORY]->(c:CameraCategory)
OPTIONAL MATCH (m)-[sf:SUITABLE_FOR]->(u:UseCase)
OPTIONAL MATCH (m)-[:HAS_REASON]->(r:Reason)
WITH pref, m, b, c,
     max(CASE WHEN u.name = pref.useCase THEN sf.score ELSE 0 END) AS useScore,
     collect(DISTINCT r.name) AS reasons
WHERE m.price <= pref.budget
  AND (pref.brand = '' OR b.name = pref.brand)
  AND (pref.category = '' OR c.name = pref.category)
WITH m, b, c, useScore, reasons,
     CASE WHEN m.price <= pref.budget THEN 20 ELSE -30 END AS budgetScore,
     CASE WHEN pref.brand = '' OR b.name = pref.brand THEN 10 ELSE 0 END AS brandScore,
     CASE WHEN pref.category = '' OR c.name = pref.category THEN 10 ELSE 0 END AS categoryScore
RETURN m.name AS 推荐型号,
       b.name AS 品牌,
       c.name AS 类别,
       m.price AS 价格,
       m.releaseYear AS 发布年份,
       useScore + budgetScore + brandScore + categoryScore AS 综合推荐分,
       reasons AS 推荐理由
ORDER BY 综合推荐分 DESC, 价格 ASC
LIMIT 8;

// 示例：解释某一台相机为什么被推荐
MATCH (m:CameraModel {name:'Alpha 7 IV'})
OPTIONAL MATCH (m)-[:PRODUCED_BY]->(b:Brand)
OPTIONAL MATCH (m)-[:BELONGS_TO_CATEGORY]->(c:CameraCategory)
OPTIONAL MATCH (m)-[:ACHIEVES_INDEX]->(i:ParameterIndex)
OPTIONAL MATCH (m)-[:HAS_REASON]->(r:Reason)
OPTIONAL MATCH (m)-[:COMPATIBLE_WITH]->(l:Lens)
RETURN m.name AS 型号,
       b.name AS 品牌,
       c.name AS 类别,
       m.price AS 价格,
       collect(DISTINCT i.name) AS 性能指标,
       collect(DISTINCT r.name) AS 推荐理由,
       collect(DISTINCT l.name) AS 兼容镜头;

// 示例：面向“已有镜头”的导购
// 把品牌名改成用户已有镜头品牌，例如索尼、佳能、尼康、富士。
WITH '索尼' AS lensBrand, 20000 AS budget
MATCH (m:CameraModel)-[:COMPATIBLE_WITH]->(l:Lens)-[:PRODUCED_BY]->(b:Brand {name:lensBrand})
OPTIONAL MATCH (m)-[:HAS_REASON]->(r:Reason)
WHERE m.price <= budget
RETURN m.name AS 推荐机身,
       m.price AS 价格,
       count(DISTINCT l) AS 可兼容镜头数,
       collect(DISTINCT l.name) AS 可用镜头,
       collect(DISTINCT r.name) AS 推荐理由
ORDER BY 可兼容镜头数 DESC, 价格 ASC;
