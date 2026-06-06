---
name: java-build-diagnosis
description: Java 构建诊断。当用户提到 "编译错误", "build error", "依赖冲突", "类找不到" 时自动触发。
allowed-tools: Read, Grep, Glob, Bash
model: opus
---

# Java 构建诊断

快速诊断和修复 Java 编译及构建问题。

## 诊断流程

### 1. 读取错误信息
- 关注第一个错误（后续错误常为连锁反应）
- 区分编译错误 vs 运行时错误 vs 构建配置错误

### 2. 常见问题及修复

| 错误模式 | 可能原因 | 修复方案 |
|----------|----------|----------|
| `cannot find symbol` | 类名拼写错误/缺少 import/类路径不对 | 检查类名大小写，添加 import |
| `class X is public, should be declared in X.java` | 文件名与 public 类不匹配 | 重命名文件或修正类名 |
| `unmappable character for encoding GBK` | 编码问题 | `javac -encoding UTF-8` |
| `NoClassDefFoundError` | 运行时类路径缺少 jar | `java -cp .:lib/* ClassName` |
| `NoSuchMethodError` | jar 版本冲突 | 检查依赖版本，用 `mvn dependency:tree` |
| `package does not exist` | 缺少 Maven/Gradle 依赖 | 在 pom.xml/build.gradle 中添加 |
| `illegal start of expression` | 语法错误(少括号/分号) | 检查括号匹配 |

### 3. 编译命令速查

```bash
# 单文件编译（最常用）
javac -encoding UTF-8 FileName.java

# 多文件编译
javac -encoding UTF-8 -d out/ src/**/*.java

# 指定 classpath
javac -encoding UTF-8 -cp .:lib/gson.jar FileName.java

# Maven 编译
mvn compile

# Gradle 编译
gradle compileJava
```

## 输出格式
```markdown
## 构建诊断: {错误摘要}

### 错误
\`\`\`
{原始错误信息}
\`\`\`

### 根因
{分析}

### 修复
1. {具体步骤}
2. {验证命令}
```
