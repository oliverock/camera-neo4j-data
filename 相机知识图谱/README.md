# 相机知识图谱项目目录

## 最终保留文件

- `normalized_nodes.csv`：最终归一化节点表。
- `normalized_edges.csv`：最终归一化边表。
- `camera_advisor_app.py`：相机购买建议对话系统。
- `requirements.txt`：Python 依赖。
- `camera_graph_import.cypher`：初始图谱导入脚本。
- `导购对话系统使用说明.md`：网页系统使用说明。
- `Neo4j导入与导购应用说明.md`：Neo4j 操作说明。

## 运行对话系统

```powershell
cd F:\dongqiyan\知识图谱期末大作业\相机知识图谱
py camera_advisor_app.py
```

访问：

```text
http://127.0.0.1:5000
```

## Neo4j 连接

```text
URI: neo4j://127.0.0.1:7687
User: neo4j
Password: 123456789
```

## 中间文件

历史 CSV、扩容脚本和临时抓取结果已归档到 `archive_intermediate`。
