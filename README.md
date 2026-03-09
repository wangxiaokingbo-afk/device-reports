# 设备检测报告系统

自动生成的设备检测报告页面，支持钉钉直接访问。

## 🌐 访问地址

**https://wangxiaokingbo-afk.github.io/device-reports/**

## 📋 功能

- ✅ 结论摘要展示
- ✅ 关键指标卡片
- ✅ 详细数据表格
- ✅ 优化建议列表
- ✅ 自动刷新按钮
- ✅ 移动端适配

## 🔧 更新报告

### 方式一：使用脚本

```bash
cd /Users/ssd/.openclaw/workspace/device-reports
./update-report.sh "设备运行正常" "success"
```

### 方式二：直接修改 JSON

编辑 `report-data.json`，然后：

```bash
git add report-data.json
git commit -m "更新报告数据"
git push origin main
```

### 方式三：通过 API 自动更新

GitHub Actions 会在每次 push 后自动部署，约 1-2 分钟生效。

## 📊 数据格式

```json
{
  "conclusion": "结论文本",
  "status": "success|warning|error",
  "timestamp": "2026-03-09 11:30:00",
  "metrics": [
    {"value": "数值", "label": "指标名称"}
  ],
  "details": [
    {"item": "检测项", "value": "数值", "status": "success", "statusText": "状态", "note": "备注"}
  ],
  "recommendations": ["建议 1", "建议 2"]
}
```

## 🎨 状态样式

- `success` → 绿色（正常）
- `warning` → 黄色（警告）
- `error` → 红色（异常）

## 📱 钉钉使用

在钉钉消息中直接发送链接即可：
```
📊 检测报告已生成
查看详情：https://wangxiaokingbo-afk.github.io/device-reports/
```

---

由 OpenClaw 自动部署 🍊
