# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Project Overview

Java 学习与实践项目。技术栈以 Java SE 为核心，逐步扩展至 Spring Boot 企业级开发。

## Commands

```bash
# 编译单个文件
javac -encoding UTF-8 FileName.java

# 运行编译后的类
java -cp . ClassName

# 编译所有 Java 文件
javac -encoding UTF-8 *.java

# 清理编译产物
rm -f *.class
```

## Project Structure

```
src/
├── main/java/...     # 源代码
├── test/java/...     # 测试代码
lib/                   # 第三方 jar 包
```

## Code Style

### Java 编码规范
- 文件名与 public 类名一致，一个文件一个类
- 类名：PascalCase（如 `UserService`）
- 方法/变量：camelCase（如 `findUserById`）
- 常量：UPPER_SNAKE_CASE（如 `MAX_RETRY_COUNT`）
- 包名：全小写，按域反转命名（如 `com.example.myapp`）
- 缩进：4 空格，不用 Tab
- 每行不超过 120 字符
- 必须有类级别 Javadoc 注释，公开方法必须有方法级别 Javadoc

### 命名约定
- 实体类：名词（`User`, `Order`）
- Service 接口：`XxxService`，实现类：`XxxServiceImpl`
- Repository/DAO：`XxxRepository` 或 `XxxDao`
- 测试方法：`should_预期行为_when_条件()` 或 `methodName_StateUnderTest_ExpectedBehavior`

### 最佳实践
- 遵循 SOLID 原则（单一职责、开闭、里氏替换、接口隔离、依赖反转）
- 面向接口编程，依赖注入
- 优先使用不可变对象（Immutable）
- 空集合优于 null，使用 `Optional<T>` 处理可能为空的返回值
- 异常要精确，不吞异常，不在循环中用 try-catch
- 日志用 SLF4J，不用 `System.out.println`

## Testing

- 测试框架：JUnit 5 + Mockito
- 测试与源码分离：`src/test/java/`
- 覆盖目标：核心业务逻辑 ≥ 80%
- AAA 模式：Arrange → Act → Assert

## Git Workflow

- 主分支：`main`
- 功能分支：`feature/short-description`
- 修复分支：`fix/short-description`
- 提交格式：`type(scope): description`
  - type: feat | fix | refactor | test | docs | chore
  - 示例：`feat(user): add login validation`

## Documentation

- 每个模块有 README.md
- API 用 Javadoc 注释
- 复杂逻辑有行内注释说明"为什么"，而非"做什么"
