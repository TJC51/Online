---
description: 编译指定的 Java 文件
argument-hint: <ClassName>
---
编译 Java 文件。对于 `$ARGUMENTS`：

1. 查找对应的 .java 文件
2. 执行: `javac -encoding UTF-8 $ARGUMENTS.java`
3. 如果编译成功，告知用户 "✓ 编译成功"
4. 如果编译失败，使用 java-build-diagnosis 技能分析错误
