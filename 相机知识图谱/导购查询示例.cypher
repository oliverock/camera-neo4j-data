// 1. 总览知识图谱
MATCH p=()-[]->()
RETURN p
LIMIT 120;

// 2. 预算 17000 元以内的全画幅相机
MATCH (m:CameraModel)-[:BELONGS_TO_CATEGORY]->(c:CameraCategory),
      (m)-[:PRODUCED_BY]->(b:Brand)
WHERE c.name = '全画幅微单' AND m.price <= 17000
RETURN m.name AS 型号, b.name AS 品牌, c.name AS 类别, m.price AS 价格, m.releaseYear AS 发布年份
ORDER BY m.price ASC;

// 3. 面向视频创作的购买建议
MATCH (m:CameraModel)-[s:SUITABLE_FOR]->(u:UseCase {name:'视频创作'})
OPTIONAL MATCH (m)-[:PRODUCED_BY]->(b:Brand)
OPTIONAL MATCH (m)-[:HAS_REASON]->(r:Reason)
RETURN m.name AS 推荐型号, b.name AS 品牌, m.price AS 价格, s.score AS 推荐分,
       collect(DISTINCT r.name) AS 推荐理由
ORDER BY s.score DESC, m.price ASC;

// 4. 入门用户导购：价格低、重量轻、适合学习
MATCH (m:CameraModel)-[s:SUITABLE_FOR]->(:UseCase {name:'入门学习'})
OPTIONAL MATCH (m)-[:PRODUCED_BY]->(b:Brand)
RETURN m.name AS 推荐型号, b.name AS 品牌, m.price AS 价格, m.weight AS 重量g, s.note AS 说明
ORDER BY m.price ASC;

// 5. 已有某品牌镜头系统时，查询兼容机身
MATCH (m:CameraModel)-[:COMPATIBLE_WITH]->(l:Lens)-[:PRODUCED_BY]->(b:Brand {name:'索尼'})
RETURN m.name AS 机身, collect(DISTINCT l.name) AS 可用镜头, count(DISTINCT l) AS 镜头数
ORDER BY 镜头数 DESC, m.price ASC;

// 6. 预算 + 用途 + 品牌偏好的综合导购模板
WITH 17000 AS budget, '视频创作' AS useCaseName, '索尼' AS preferredBrand
MATCH (m:CameraModel)-[s:SUITABLE_FOR]->(:UseCase {name:useCaseName})
MATCH (m)-[:PRODUCED_BY]->(b:Brand)
OPTIONAL MATCH (m)-[:HAS_REASON]->(r:Reason)
WHERE m.price <= budget AND (preferredBrand = '' OR b.name = preferredBrand)
RETURN m.name AS 推荐型号, b.name AS 品牌, m.price AS 价格, s.score AS 推荐分,
       collect(DISTINCT r.name) AS 推荐理由
ORDER BY s.score DESC, m.price ASC;

// 7. 查询某型号的完整解释路径
MATCH p=(m:CameraModel {name:'Alpha 7 IV'})--()
RETURN p;
