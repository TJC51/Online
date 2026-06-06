---
description: 编译并运行指定的 Java 类
argument-hint: <ClassName>
---
编译并运行 Java 类。对于 `$ARGUMENTS`：

1. 先编译: `javac -encoding UTF-8 $ARGUMENTS.java`
2. 编译成功后运行: `java -cp . $ARGUMENTS`
3. 展示运行输出
4. 如果编译失败，分析并提示修复方案
