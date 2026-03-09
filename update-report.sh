#!/bin/bash
# 设备报告更新脚本
# 用法：./update-report.sh "结论文本" "status(success/warning/error)"

REPORT_DIR="$(cd "$(dirname "$0")" && pwd)"
DATA_FILE="$REPORT_DIR/report-data.json"

# 默认值
CONCLUSION="${1:-设备运行正常}"
STATUS="${2:-success}"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# 生成示例数据（实际使用时可以替换为真实检测数据）
cat > "$DATA_FILE" << EOF
{
  "conclusion": "$CONCLUSION",
  "status": "$STATUS",
  "timestamp": "$TIMESTAMP",
  "metrics": [
    {"value": "98%", "label": "健康度"},
    {"value": "23°C", "label": "温度"},
    {"value": "45ms", "label": "响应时间"},
    {"value": "在线", "label": "状态"}
  ],
  "details": [
    {"item": "CPU 使用率", "value": "32%", "status": "success", "statusText": "正常", "note": "低于阈值 80%"},
    {"item": "内存使用", "value": "4.2GB/8GB", "status": "success", "statusText": "正常", "note": "可用内存充足"},
    {"item": "磁盘空间", "value": "120GB/500GB", "status": "success", "statusText": "正常", "note": "剩余 76%"},
    {"item": "网络延迟", "value": "45ms", "status": "success", "statusText": "正常", "note": "连接稳定"},
    {"item": "服务状态", "value": "运行中", "status": "success", "statusText": "正常", "note": "所有服务正常"}
  ],
  "recommendations": [
    "建议定期清理日志文件，保持系统整洁"
  ]
}
EOF

# 提交并推送
cd "$REPORT_DIR"
git add report-data.json
git commit -m "Update report: $TIMESTAMP"
git push origin main

echo "✅ 报告已更新并部署"
echo "📊 查看地址：https://wangxiaokingbo-afk.github.io/device-reports/"
