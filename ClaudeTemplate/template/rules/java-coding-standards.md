---
paths:
  - "**/*.java"
description: Java 编码规范，处理 .java 文件时自动加载
---

# Java 编码规范

## 命名规范

| 元素 | 规范 | 示例 |
|------|------|------|
| 类/接口 | PascalCase | `UserService`, `OrderRepository` |
| 方法/变量 | camelCase | `findById()`, `userName` |
| 常量 | UPPER_SNAKE_CASE | `MAX_RETRY_COUNT` |
| 包名 | 小写，点分隔 | `com.example.myapp.service` |
| 枚举 | PascalCase + 单数 | `PaymentStatus` |

## 格式规范
- 缩进：4 空格（不用 Tab）
- 每行最多 120 字符
- 大括号：K&R 风格（左括号在行末，右括号独占一行）
- 空行分离逻辑段落
- import 不使用通配符 (`import java.util.*` → 逐一导入)

## 注释规范
- 公共 API 必须有 Javadoc（`@param`, `@return`, `@throws`）
- 复杂逻辑需要行内注释，解释"为什么"而非"做什么"
- 不要用注释解释显而易见的代码
- 临时代码用 `// FIXME:` 和 `// TODO:` 标注，带日期

## 异常处理
- 精确捕获异常类型，不捕获 `Exception` 泛型
- 不在 finally 块中抛异常
- 不在循环内用 try-catch
- 自定义异常以 `Exception` 为后缀
- 异常消息必须包含关键上下文（如 ID、输入值）

## SOLID 原则
1. **S** - 每个类只有一个职责
2. **O** - 对扩展开放、对修改关闭（策略模式、模板方法）
3. **L** - 子类可替换父类而不破坏程序
4. **I** - 接口小而专，不强迫实现不需要的方法
5. **D** - 依赖抽象而非具体类

## 推荐实践
- 优先使用 `Optional<T>` 而非 null
- 返回空集合 `Collections.emptyList()` 而非 null
- 使用 `try-with-resources` 管理 IO 资源
- 避免 `System.out.println`，使用 SLF4J 日志
- 不可变类用 `final` 修饰字段，不提供 setter
- equals() 和 hashCode() 必须同时重写
