---
name: java-refactor
description: Java 代码重构。当用户提到 "refactor", "重构", "优化代码", "改善代码" 时自动触发。
allowed-tools: Read, Grep, Glob, Edit, Bash
model: sonnet
---

# Java 代码重构

识别代码异味并执行安全重构。

## 常见异味 → 重构手法

| 异味 | 描述 | 重构手法 |
|------|------|----------|
| 长方法 | 方法 > 30 行 | Extract Method |
| 大类 | 类 > 300 行 | Extract Class |
| 长参数列表 | 参数 > 4 个 | Introduce Parameter Object |
| Switch 语句 | 类型判断 | Replace with Polymorphism |
| 重复代码 | 多处相似逻辑 | Extract Method / Pull Up |
| 霰弹式修改 | 一个改动影响多处 | Move Method / Move Field |
| 特性依恋 | 方法过多访问其他类 | Move Method |
| 数据泥团 | 总是同时出现的字段 | Extract Class |
| 原始痴迷 | 用 String/int 表示复杂概念 | Replace with Value Object |
| 临时字段 | 某些字段只在特定情况有效 | Extract Class |

## 重构原则
1. **先加测试** — 确保现有行为被覆盖
2. **小步快跑** — 每次只做一个变换
3. **运行测试** — 每次变换后确认行为不变
4. **独立提交** — 每次重构单独提交

## 输出格式
```markdown
## 重构分析: {类名}

| 异味 | 严重度 | 位置 | 建议手法 |
|------|--------|------|----------|

## 重构步骤
1. [安全检查] ...
2. [步骤1] ...
3. [验证] 运行对应测试
```
