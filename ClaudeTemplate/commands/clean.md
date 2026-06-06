---
description: 清理所有 .class 编译产物
---
清理项目中的编译产物：

1. 列出当前目录所有 .class 文件: `find . -name "*.class"`
2. 确认后删除: `rm *.class`（若在子目录中则递归查找并删除）
3. 输出: "✓ 已清理 N 个 .class 文件"
