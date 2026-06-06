# 📁 项目文件目录

> 本文档记录项目所有文件的用途，方便查阅。不作为 Claude Code 配置使用。

**最后更新**: 2026-06-06  

---

## 📂 根目录

| 文件 | 说明 | 状态 |
|------|------|------|
| [CLAUDE.md](CLAUDE.md) | 项目指令文件，80 行，含编码/测试/Git规范 | ✏️ 增强 |
| [HelloWorld.java](HelloWorld.java) | 入门示例 | ✅ 原有 |
| [Test.java](Test.java) | 测试示例 | ✅ 原有 |
| [DIRECTORY.md](DIRECTORY.md) | 📍 本文件 — 项目目录索引 | 🆕 新建 |

---

## 📂 `.claude/` — Claude Code 配置

### 🔧 settings.json — 权限与配置

| 文件 | 说明 |
|------|------|
| [.claude/settings.json](.claude/settings.json) | 团队共享配置：权限白/黑名单、钩子、模型 |
| [.claude/settings.local.json](.claude/settings.local.json) | 个人覆盖配置（不提交 Git） |

---

### 🤖 agents/ — 子代理定义（23 + 1 catalog）

#### 📋 01 — 业务分析

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [01-business-analysis/business-analyst.md](.claude/agents/01-business-analysis/business-analyst.md) | `business-analyst` | 业务需求分析、竞品调研、市场分析 |
| [01-business-analysis/requirements-analyst.md](.claude/agents/01-business-analysis/requirements-analyst.md) | `requirements-analyst` | 功能需求拆解、验收标准定义 |
| [01-business-analysis/user-story-writer.md](.claude/agents/01-business-analysis/user-story-writer.md) | `user-story-writer` | 用户故事编写、敏捷需求文档 |

#### 🏗️ 02 — 架构设计

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [02-architecture-design/system-architect.md](.claude/agents/02-architecture-design/system-architect.md) | `system-architect` | 系统架构设计、技术选型、ADR |
| [02-architecture-design/api-designer.md](.claude/agents/02-architecture-design/api-designer.md) | `api-designer` | RESTful/GraphQL API 设计 |
| [02-architecture-design/data-modeler.md](.claude/agents/02-architecture-design/data-modeler.md) | `data-modeler` | 数据建模、ER 图、索引设计 |
| [02-architecture-design/security-architect.md](.claude/agents/02-architecture-design/security-architect.md) | `security-architect` | 威胁建模、OWASP 合规 |

#### 💻 03 — 开发实现

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [03-development/code-implementer.md](.claude/agents/03-development/code-implementer.md) | `code-implementer` | 功能实现、代码生成、Bug 修复 |
| [03-development/code-reviewer.md](.claude/agents/03-development/code-reviewer.md) | `code-reviewer` | 4维审查：正确性/安全/性能/可维护性 |
| [03-development/refactoring-specialist.md](.claude/agents/03-development/refactoring-specialist.md) | `refactoring-specialist` | 代码异味识别、设计模式应用 |
| [03-development/performance-optimizer.md](.claude/agents/03-development/performance-optimizer.md) | `performance-optimizer` | 性能分析、瓶颈定位、优化实施 |

#### 🧪 04 — 测试与质量

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [04-testing-qa/test-engineer.md](.claude/agents/04-testing-qa/test-engineer.md) | `test-engineer` | 单元/集成/E2E 测试，AAA 模式 |
| [04-testing-qa/security-auditor.md](.claude/agents/04-testing-qa/security-auditor.md) | `security-auditor` | OWASP Top 10、CVE 扫描 |
| [04-testing-qa/accessibility-tester.md](.claude/agents/04-testing-qa/accessibility-tester.md) | `accessibility-tester` | WCAG 2.1 AA/AAA 合规审计 |

#### 🚀 05 — DevOps 与部署

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [05-devops-deployment/cicd-engineer.md](.claude/agents/05-devops-deployment/cicd-engineer.md) | `cicd-engineer` | CI/CD 流水线设计、部署策略 |
| [05-devops-deployment/infrastructure-engineer.md](.claude/agents/05-devops-deployment/infrastructure-engineer.md) | `infrastructure-engineer` | IaC、Docker、K8s、云基础设施 |
| [05-devops-deployment/release-manager.md](.claude/agents/05-devops-deployment/release-manager.md) | `release-manager` | 发布管理、版本策略、变更控制 |

#### 🔧 06 — 运维监控

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [06-operations-monitoring/sre-engineer.md](.claude/agents/06-operations-monitoring/sre-engineer.md) | `sre-engineer` | SLO/SLI、监控告警、事后复盘 |
| [06-operations-monitoring/incident-responder.md](.claude/agents/06-operations-monitoring/incident-responder.md) | `incident-responder` | 故障应急响应、根因分析、止损 |

#### 📖 07 — 文档撰写

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [07-documentation/technical-writer.md](.claude/agents/07-documentation/technical-writer.md) | `technical-writer` | 技术文档、README、架构文档 |
| [07-documentation/api-documenter.md](.claude/agents/07-documentation/api-documenter.md) | `api-documenter` | API 文档、OpenAPI/Swagger |

#### 📊 08 — 项目管理

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [08-project-management/project-planner.md](.claude/agents/08-project-management/project-planner.md) | `project-planner` | 项目计划、WBS、里程碑 |
| [08-project-management/progress-tracker.md](.claude/agents/08-project-management/progress-tracker.md) | `progress-tracker` | 进度跟踪、风险监控、状态报告 |

#### 📇 目录代理

| 文件 | 代理名 | 说明 |
|------|--------|------|
| [catalog.md](.claude/agents/catalog.md) | `agent-catalog` | 主目录索引，路由到所有其他代理 |

---

### 📏 rules/ — 路径作用域规则（5 个）

| 文件 | 匹配路径 | 说明 |
|------|----------|------|
| [rules/java-coding-standards.md](.claude/rules/java-coding-standards.md) | `**/*.java` | 命名规范、格式、SOLID、异常处理 |
| [rules/java-testing.md](.claude/rules/java-testing.md) | `**/*Test*.java` | JUnit 5、AAA、Mockito、覆盖率 |
| [rules/java-project-structure.md](.claude/rules/java-project-structure.md) | `**/*.java` | 包结构、分层架构、设计约束 |
| [rules/git-workflow.md](.claude/rules/git-workflow.md) | 通用 | 分支策略、Conventional Commits |
| [rules/documentation.md](.claude/rules/documentation.md) | `**/*.md` | README 模板、Markdown 规范 |
| [rules/common.md](.claude/rules/common.md) | 通用 | 用户自定义全局规则（偏好、约定、注意事项） |

---

### 🎯 skills/ — 可复用技能（5 个新建）

| 文件 | 技能名 | 触发场景 |
|------|--------|----------|
| [skills/java-code-review/SKILL.md](.claude/skills/java-code-review/SKILL.md) | `java-code-review` | 用户说"review"、"审查" |
| [skills/java-refactor/SKILL.md](.claude/skills/java-refactor/SKILL.md) | `java-refactor` | 用户说"重构"、"优化代码" |
| [skills/java-test-generator/SKILL.md](.claude/skills/java-test-generator/SKILL.md) | `java-test-generator` | 用户说"测试"、"JUnit" |
| [skills/java-build-diagnosis/SKILL.md](.claude/skills/java-build-diagnosis/SKILL.md) | `java-build-diagnosis` | 用户说"编译错误"、"类找不到" |
| [skills/java-spring-initializr/SKILL.md](.claude/skills/java-spring-initializr/SKILL.md) | `java-spring-initializr` | 用户说"Spring Boot"、"初始化项目" |

---

### ⚡ commands/ — 自定义斜杠命令（4 个新建）

| 文件 | 命令 | 用法 |
|------|------|------|
| [commands/compile.md](.claude/commands/compile.md) | `/compile <类名>` | 编译 Java 文件 |
| [commands/run.md](.claude/commands/run.md) | `/run <类名>` | 编译 + 运行 |
| [commands/clean.md](.claude/commands/clean.md) | `/clean` | 清理 .class 编译产物 |
| [commands/new-class.md](.claude/commands/new-class.md) | `/new-class <类名>` | 生成类模板 |

---

### 🪝 hooks/ — 事件驱动自动化（3 个文件）

| 文件 | 说明 |
|------|------|
| [hooks/hooks.json](.claude/hooks/hooks.json) | 钩子注册：PostToolUse 编译检查 + PreToolUse 提交检查 |
| [hooks/scripts/compile-check.sh](.claude/hooks/scripts/compile-check.sh) | 编译检查脚本（编辑 .java 后自动触发） |
| [hooks/scripts/format-java.sh](.claude/hooks/scripts/format-java.sh) | 格式提示脚本（编辑 .java 后自动触发） |

---

### 🎨 output-styles/ — 输出风格（2 个）

| 文件 | 说明 |
|------|------|
| [output-styles/professional.md](.claude/output-styles/professional.md) | 专业风格：精炼、英文、代码优先 |
| [output-styles/teaching.md](.claude/output-styles/teaching.md) | 教学模式：中文详解、逐步引导 |

---

### 🧠 agent-memory/ — 代理持久记忆

| 文件 | 说明 |
|------|------|
| [agent-memory/.gitkeep](.claude/agent-memory/.gitkeep) | 占位文件，为 23 个 agent 预留记忆目录 |

---

## 📂 docs/ — 设计文档

| 文件 | 说明 |
|------|------|
| [docs/superpowers/specs/2026-06-06-claude-config-full-stack-design.md](docs/superpowers/specs/2026-06-06-claude-config-full-stack-design.md) | 规格设计文档 |
| [docs/superpowers/plans/2026-06-06-claude-config-full-stack.md](docs/superpowers/plans/2026-06-06-claude-config-full-stack.md) | 实施计划文档 |

---

## 📊 统计

| 分类 | 数量 |
|------|------|
| Agents（子代理） | 24（23 专业 + 1 catalog） |
| Rules（规则） | 5 |
| Skills（技能） | 5（新建） |
| Commands（命令） | 4（新建） |
| Hooks（钩子） | 3（hooks.json + 2 脚本） |
| Output Styles（输出风格） | 2 |
| Settings（配置） | 2（.json + .local.json） |
| Agent Memory | 1（.gitkeep 占位） |
| 根目录文件 | 4（CLAUDE.md + Java + Test + DIRECTORY.md） |
| 设计文档 | 2（spec + plan） |
| **总计** | **52** |

---

## 🔗 参考来源

- [Anthropic Claude Code 官方文档](https://docs.anthropic.com/en/docs/claude-code)
- [wshobson/agents](https://github.com/wshobson/agents) (13.4k stars)
- [stretchcloud/claude-code-unified-agents](https://github.com/stretchcloud/claude-code-unified-agents) (737+ stars)
- [dl-ezo/claude-code-sub-agents](https://github.com/dl-ezo/claude-code-sub-agents)
- [aadelb/claude-sdlc-orchestrator](https://github.com/aadelb/claude-sdlc-orchestrator) (96 agents)
- [rshah515/claude-code-subagents](https://github.com/rshah515/claude-code-subagents) (165+ agents)
- [The Complete .claude Directory Guide](https://computingforgeeks.com/claude-code-dot-claude-directory-guide/)
