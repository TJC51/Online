---
paths:
  - "**/*.java"
description: Java 项目结构规范，处理项目结构问题时自动加载
---

# Java 项目结构规范

## 标准目录结构

```
project-root/
├── CLAUDE.md
├── .claude/
├── src/
│   ├── main/java/              # 源代码
│   │   └── com/example/app/
│   │       ├── controller/     # 控制器 (MVC) 或 REST API
│   │       ├── service/        # 业务逻辑接口
│   │       │   └── impl/       # 业务逻辑实现
│   │       ├── repository/     # 数据访问层 (DAO)
│   │       ├── model/          # 实体类 / DTO
│   │       │   ├── entity/     # 数据库实体
│   │       │   └── dto/        # 数据传输对象
│   │       ├── config/         # 配置类
│   │       ├── exception/      # 自定义异常
│   │       └── util/           # 工具类
│   └── test/java/              # 测试代码（镜像 main 结构）
├── resources/                  # 配置文件
├── lib/                        # 第三方 jar
└── docs/                       # 设计文档
```

## 分层架构

```
Controller → Service → Repository → Database
    ↓            ↓
   DTO    ←   Entity
```

- **Controller**: 接收请求、参数校验、返回响应。不包含业务逻辑。
- **Service**: 业务逻辑。接口与实现分离（面向接口编程）。
- **Repository**: 数据访问。封装 SQL/ORM 操作。
- **Model**: 实体（Entity）和 DTO 分离。Entity 对应数据库，DTO 对应 API。

## 设计约束
- Controller 不直接调用 Repository
- Service 之间可以相互调用，但要避免循环依赖
- DTO 转换逻辑应放在单独的 Converter/Mapper 工具类中
