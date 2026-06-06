---
paths:
  - "**/*.md"
  - "**/README.md"
description: 文档规范，处理 Markdown 文件时自动加载
---

# 文档规范

## README.md 模板

```markdown
# 项目名称

## 概述
一句话描述 + 核心功能列表

## 环境要求
- Java 17+
- Maven 3.8+ / Gradle 8+

## 快速开始
\```bash
git clone <repo>
cd <project>
mvn spring-boot:run
\```

## 项目结构
目录树说明

## API 文档
链接或摘要

## 开发指南
- 编码规范
- 测试规范
- 贡献流程

## 许可证
MIT / Apache 2.0
```

## Markdown 规则
- 标题层级：h1 仅用于文件标题，h2 用于章节
- 代码块必须指定语言
- 链接使用相对路径（引用本项目文件）
- 列表项以空行分隔（提高可读性）
- 表格要对齐，列不宜超过4列
