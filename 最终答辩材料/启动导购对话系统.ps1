$ErrorActionPreference = "Stop"

$projectRoot = "F:\dongqiyan\知识图谱期末大作业\相机知识图谱"
Set-Location $projectRoot

Write-Host "Starting camera advisor app..."
Write-Host "Open: http://127.0.0.1:5000"
py camera_advisor_app.py
