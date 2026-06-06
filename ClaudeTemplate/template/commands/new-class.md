---
description: 快速生成 Java 类模板
argument-hint: <ClassName>
---
为 `$ARGUMENTS` 生成标准 Java 类模板：

1. 检查是否已有同名 .java 文件
2. 若不存在，生成模板：

```java
/**
 * ${ARGUMENTS} 类
 *
 * @author Claude Code
 * @since 2026-06-06
 */
public class ${ARGUMENTS} {
    
}
```

3. 若存在，提示用户并询问是否要查看当前内容
