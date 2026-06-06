---
name: java-test-generator
description: Java 测试生成器。当用户提到 "测试", "test", "生成测试", "单元测试", "JUnit" 时自动触发。
allowed-tools: Read, Grep, Glob, Edit, Write, Bash
model: sonnet
---

# Java 测试生成器

为目标 Java 类生成 JUnit 5 + Mockito 单元测试。

## 生成策略

### 分析方法签名
对于每个 public 方法：
1. 识别参数类型（需要构造测试数据）
2. 识别返回值类型（需要断言）
3. 识别可能抛出的异常（需要异常测试）
4. 识别边界条件（null, 空集合, 零值, 最大值）

### 测试覆盖清单
- [ ] Happy Path（正常输入 → 预期输出）
- [ ] Null 参数行为
- [ ] 空集合/空字符串输入
- [ ] 边界值（0, Integer.MAX_VALUE, 负数）
- [ ] 异常抛出场景
- [ ] 依赖返回异常时的行为

## 生成模板

```java
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.*;
import org.mockito.junit.jupiter.MockitoExtension;
import static org.assertj.core.api.Assertions.*;
import static org.mockito.BDDMockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("{TargetClass} 单元测试")
class {TargetClass}Test {

    @Mock
    private DependencyService dependencyService;

    @InjectMocks
    private {TargetClass} target;

    @Nested
    @DisplayName("methodName 方法")
    class MethodName {

        @Test
        @DisplayName("正常情况 → 返回预期结果")
        void should_returnExpected_when_normalInput() {
            // Arrange
            // Act
            // Assert
        }

        @Test
        @DisplayName("参数为null → 抛出 IllegalArgumentException")
        void should_throwIllegalArgumentException_when_inputIsNull() {
            assertThatThrownBy(() -> target.method(null))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("must not be null");
        }
    }
}
```

## 工作原则
- 测试名必须表达场景（不写 testMethod1 这类无意义名称）
- 每个测试独立，不依赖执行顺序
- 使用 AssertJ 断言（更流畅且类型安全）
- 使用 BDDMockito (given/willReturn 风格)
