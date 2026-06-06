---
paths:
  - "**/*Test.java"
  - "**/*Tests.java"
  - "**/test/**/*.java"
description: Java 测试规范，处理测试文件时自动加载
---

# Java 测试规范

## 框架
- **JUnit 5** (Jupiter) 为默认测试框架
- **Mockito** 用于模拟外部依赖
- **AssertJ** 用于流畅断言风格

## 测试文件组织
- 测试类名称：`{TargetClass}Test`
- 测试包路径与源码一致：`src/test/java/` 对应 `src/main/java/`
- 一个测试类对应一个源码类

## 命名规范
- 测试方法：`should_ExpectedBehavior_when_Condition()`
  - 示例：`should_returnEmptyList_when_noUsersFound()`
- 或：`methodName_StateUnderTest_ExpectedBehavior()`
  - 示例：`findById_UserNotFound_ThrowsNotFoundException()`

## AAA 模式

```java
@Test
void should_lockAccount_after_threeFailedAttempts() {
    // Arrange（准备）
    Account account = new Account("user@test.com");
    
    // Act（执行）
    account.loginFailed();
    account.loginFailed();
    account.loginFailed();
    
    // Assert（断言）
    assertThat(account.isLocked()).isTrue();
    assertThat(account.getFailedAttempts()).isEqualTo(3);
}
```

## 测试类型
- **单元测试**：测试单个类/方法逻辑，Mock 所有外部依赖
- **集成测试**：测试模块间交互，用 `@SpringBootTest`（若用 Spring）
- 数据库测试：优先用 H2 内存数据库

## Mock 原则
- Mock 外部依赖（HTTP 客户端、数据库、文件系统）
- 不 Mock 值对象（POJO、DTO）
- 不 Mock 本模块内的类
- `verify()` 只用于有副作用的方法

## 覆盖率
- 核心业务逻辑 ≥ 80%
- 每个公开方法至少 1 个 Happy Path 测试
- 边界条件和异常路径必须覆盖
