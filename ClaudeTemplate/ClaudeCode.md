# 参考

* 菜鸟教程：https://www.runoob.com/claude-code

# 基本使用

## 客户端

* 网页：禁用&不适用于编程，仅用于对话

* cli：基于 npm 安装使用

* VSCode

  > * Claude Code for VS Code

* IDEA

  > * Claude Code

## 命令

* 启动

  > * claude --model XXX：指定模型
  >
  > * claude --continue：继续上次会话
  >
  >   > claude --continue --fork-session：从上次会话中 fork 一份新会话（不影响上次会话）
  >
  > * claude --resume：打开会话列表
  >
  >   > claude --resume  \<session-name>|\<session-id>：按会话名称/会话ID打开
  >
  > * 补充
  >
  >   > * 会话存储位置：全局目录下 .claude\projects\XXX\xxx.JSONL

* Claude 内执行的命令

  > * !：进入纯 Shell 命令模式，用于执行非 Claude Code 命令
  >
  >   > eg：! mvn test 会执行 maven 的 test 命令
  >
  > * /：Claude Code 内置命令
  >
  > * @：文件引用系统，用于引用指定的文件/目录
  >
  > * &：后台任务

* 基本命令

  > * /model：切换模型
  > * /help：帮助
  > * /btw：询问旁路问题，不会污染主任务上下文，例如询问回答中某个技术
  > * /exit、/quit：退出
  > * /memory：查看或管理记忆

* 上下文

  > * /init：初始化项目上下文
  > * /clear：清空上下文
  > * /context：查看当前上下文
  > * /compact：手动压缩（Claude 会自动压缩）

* 权限

  > * /permissions：权限控制

## 其他

* API 配置：使用 cc-switcch

  > * Claude Code 自家的模型能力：Haiku < Sonnet < Opus
  >
  >   > 使用其他供应商的模型时，相关模型配置建议能力强弱与 Haiku|Sonnet|Opus 匹配：Claude Code 底层会根据不同的模型强度使用不同的调用机制，如果把最好的模型配在 Haiku 的位置上，可能会减弱模型的能力（被按照较次的调用机制使用）

* 检查点：两次 esc 触发，支持回滚

* 权限模式：shift + tab 切换

  > - default：每次修改文件或运行命令均需确认
  >
  > - accept edits on：修改文件无需确认，但运行命令仍需要
  >
  > - plan mode on：仅分析，不操作
  >
  > - auto mode on：模型自行决定文件的修改和命令的运行
  >
  >   > * settings.json：{"defaultMode": "auto"}
  >   > * cli：claude --enable-auto-mode
  >   > * VSCode：Settings -> Claude Code -> Allow auto permissions mode

* 作用范围

  > * user：当前用户所有项目，如 全局目录/settings.json
  > * project：当前项目，如 项目目录/settings.json
  > * local：当前项目本地专用，如 项目目录/settings.local.json

# 目录&文件

## 基本概念

* 全局目录、项目目录：二者内容基本一致，作用范围不同

  > * `C:\Users\17589\.claude`、`~/.claude`：全局目录
  > * `project\.claude`：项目目录

* frontmatter

  > * HTML/Markdown 文件头部的 YAML 区块：一个 md 只支持一个 frontmatter（最前面的内容），用于描述 md 的配置信息
  > * 使用：`---`

* 全局目录

  > * projects
  >
  >   > * 项目级持久记忆
  >   >
  >   > * 组成
  >   >
  >   >   > * 记忆：memory
  >   >   > * 会话：xxx.JSONL
  >
  > * memory：全局记忆配置
  >
  > * keybindings.json：自定义键盘快捷键
  >
  > * credentials.json：API 凭证（自动管理）
  >
  > * sessions 和 session-env
  >
  >   > * sessions：会话记录历史
  >   > * session-env：会话环境变量
  >   >
  >   > sessions：保存每次 Claude Code 会话的完整历史和工具调用记录
  >   >
  >   > session-env：保存与某个会话绑定的临时环境变量和运行环境状态，用于会话恢复
  >   >
  >   > projects：保存 Claude 从多个会话中提炼出来的项目长期记忆

## Claude.md

* 项目核心文档

* Claude.local.md：个人专属（不受 Git 控制）

  > 优先级：父目录 Claude.md -> 项目 Claude.md -> 项目 Claude.local.md

* 核心内容模块

  > * 常用命令
  > * 项目结构说明
  > * 编码规范
  > * 架构约束与禁止事项
  > * 开发环境说明

## settings.json

* 权限文件

* settings.local.json：个人专属（不受 Git 控制）

  > 优先级：父目录 settings.json-> 项目 settings.json -> 项目 settings.local.json

* permissions：权限信息

## hooks

* 生命周期钩子脚本：Claude 事件 -> 触发 Hook -> 执行脚本 -> 结果返回 Claude

* Hook 配置在 settings.json

* Hook 类型

  > | Hook             | 触发时机                   |
  > | ---------------- | -------------------------- |
  > | SessionStart     | 会话开始                   |
  > | SessionEnd       | 会话结束                   |
  > | PreToolUse       | 调用工具前                 |
  > | PostToolUse      | 调用工具后                 |
  > | UserPromptSubmit | 用户发送消息时（部分版本） |
  >
  > * 实际场景：调用工具前执行检查动作、调用工具后执行测试动作

* 案例：Claude 启动就会执行脚本

  > 1. /hooks 目录下新增 HelloWorld.sh
  >
  > 2. settings.json
  >
  >    > ```json
  >    > {
  >    >  "hooks": {
  >    >      "SessionStart": [
  >    >          {
  >    >              "hooks": [
  >    >                  {
  >    >                      "type": "command",
  >    >                      "command": "~/.claude/hooks/HelloWorld.sh"
  >    >                  }
  >    >              ]
  >    >          }
  >    >      ]
  >    >  }
  >    > }
  >    > ```

## commands

* 自定义斜杠命令目录：md 文件自动映射成 `/project:文件名` 命令

* 案例

  > * create-java.md
  >
  >   > ```markdown
  >   > 生成一个 Java 文件，根据命令后携带的入参，输出对应的内容。
  >   > 
  >   > ## 规则
  >   > 1. Java 类名使用第一个参数自动生成（PascalCase）
  >   > 2. `main` 方法中使用 `System.out.println()` 打印除第一个参数外所有传入的参数
  >   > 3. 文件名与类名一致
  >   > 
  >   > ## 示例
  >   > 输入：`/create-java Hello Hello World`
  >   > 生成：`Hello.java`，运行后输出 `Hello World`
  >   > 输入：`/create-java Greeting 你好，世界！`
  >   > 生成：`Greeting.java`，运行后输出 `你好，世界！`
  >   > 输入：`/create-java MyApp 这是一个测试`
  >   > 生成：`MyApp.java`，运行后输出 `这是一个测试`
  >   > ```
  >
  > * 使用：/create-java Test 这是一个测试案例

## rules

* 将 CLAUDE.md 中的规则拆分模块化存放，Claude 在整个会话中始终遵守：适合存放长期稳定执行的行为约定，避免 CLAUDE.md 过于臃肿

* 说明

  > * 文件数量上限：20 个（超过的不会被加载）
  >
  > * 文件长度建议：不超过 200 行
  >
  >   > ≤ 200 行：推荐大小，放在 CLAUDE.md 或 rules 中都行
  >   >
  >   > 200-500 行：建议拆分到 rules/ 目录下
  >   >
  >   > 500 行：必须拆分
  >
  > * frontmatter
  >
  >   > * paths：限定该规则只在操作特定路径下的文件时才加载
  >   >
  >   >   > ```yaml
  >   >   > ---
  >   >   > paths:
  >   >   >     - src/main/java/**/*.java
  >   >   >     - src/test/**/*.java
  >   >   > ---
  >   >   > ```

* 案例

  > code-style.md：
  >
  > ```markdown
  > ---
  >  paths:
  >     - src/main/java/**/*.java
  >     - src/test/**/*.java
  > ---
  > 
  > # Code Style Rules
  > - TypeScript 严格模式，禁用 any 类型
  > - 函数长度不超过 40 行，超出则拆分
  > - 优先使用 const，避免使用 let
  > - 导入顺序：标准库 → 三方包 → 本地模块
  > - 所有 export 的函数/类型需要 JSDoc 注释
  > - 禁止使用 console.log，使用项目 logger
  > ```

## skills

* 高级的复合工作流：当 Claude 判断某个任务适合某个 Skill 时，会自动调用

  > * 支持 自动调用 和 手动调用
  >
  >   > 命令触发：`/<skill-name>`
  >
  > * 安装：核心就是在指定目录下放置 SKILL.md
  >
  >   > * 全局目录和项目目录的 skills
  >   > * 全局目录的 plugins：Claude 的插件功能
  >
  > * 获取途径
  >
  >   > * Claude Code 的 plugins 渠道：/plugin
  >   >
  >   > * 第三方分享网站
  >   >
  >   >   > skill.sh：[The Agent Skills Directory](https://www.skills.sh/)
  >   >
  >   > * Github 开源 Skill

* 每个 Skill 是一个目录

  > * 核心文件 - SKILL.md：描述 Skill 的内容
  >
  >   > * frontmatter
  >   >
  >   >   > `name: XXX`
  >   >   >
  >   >   > `description: XXX`
  >   >   >
  >   >   > `disable-model-invocation: true`：不会自动触发，需使用命令触发
  >   >   >
  >   >   > `user-invocable: true`：命令菜单中可见
  >
  > * 其他文件：根据 Skill 复杂度，可补充相关文件供 SKILL.md 使用

## agents

* 定义可被主 Claude 实例派遣的专业子代理：在复杂任务中，主代理将子任务委派给对应专家角色，实现多代理协作。子代理在隔离上下文中运行，拥有独立的权限范围

* 案例

  > code-reviewer.md
  >
  > ```markdown
  > ---
  > name: code-reviewer
  > description: 资深代码审查员，专注代码质量与可维护性
  > ---
  > 
  > # 代码审查员
  > 
  > ## 角色定位
  > 你是一名拥有 10 年经验的资深工程师，专注于代码可读性、性能优化和最佳实践。
  > 
  > ## 审查重点
  > - 命名是否清晰表达意图
  > - 函数/类的单一职责原则
  > - 边界条件和错误处理
  > - 性能瓶颈（N+1 查询、不必要的循环等）
  > 
  > ## 权限
  > 只读访问，不直接修改文件。
  > 
  > ## 输出格式
  > 使用 Markdown 表格输出，包含：问题位置、严重程度、建议方案。
  > ```

## plugins

* Plugin：对 Claude 的 MCP、Hook、Command、Skill、Agent 进行打包，形成一个大的“工具包”

  > * 存储：全局目录下的 plugins
  > * 安装 Plugin 后会注册 Plugin 的 Skill、Command、Hook、Agent、MCP 给 Claude 使用

* 使用插件

  > * 自动触发：eg 代码审查插件
  > * 插件提供的 Command
  > * 插件提供的 Agent（自动触发）

* /plugin：管理插件

  > * /plugin、/plugin list：查看插件列表
  >
  > * /plugin install \<plugin-name>：安装插件
  >
  > * /plugin marketplace add XXX：添加 Marketplace（市场）
  >
  > * /plugin marketplace list：查看 Marketplace（市场）
  >
  > * --scope XXX：作用范围
  >
  > * /plugin update XXX：更新
  >
  > * /plugin uninstall XXX：卸载
  >
  > * /reload-plugins：重新加载

## Connectors

# MCP

## Claude 使用 MCP

* 相关命令

  > * claude mcp add：添加一个 MCP 服务器
  >
  >   > > 推荐使用 npx 下载
  >   >
  >   > * transport：支持 STDIO、SEE、HTTP，SEE已舍弃
  >   > * scope：local、project、user
  >
  > * claude mcp list：查看所有已配置服务器
  >
  > * claude mcp get \<name>：查看某个服务器详情
  >
  > * claude mcp remove \<name>：删除服务器
  >
  > * /mcp：在 Claude Code 中查看状态 / 认证
  >
  >   > 其他命令无需启动 Claude，而 /mcp 需要启动

## 推荐 MCP

* Chrome DevTools

* @benborla29/mcp-server-mysql

  > * mcp-server-mysql 中专门为 Claude Code 优化的社区分支版本，原作者是 benborla（https://github.com/benborla），由
  >     benborla29 维护 Claude Code 适配版
  >
  > * 四个独特优势
  >
  >   > * 专为 Claude Code 优化：原版 mcp-server-mysql 面向通用 MCP 客户端，而 benborla29 的分支针对 Claude Code CLI 做了适配，包括自动启动/停止钩子、会话级别生命周期管理，不会出现 “MCP 服务器残留进程” 的问题
  >   >
  >   > * 内置 SSH 隧道：大多数 MySQL MCP 包只能连接本地或同网段的数据库，这个包内置了 SSH 隧道功能，可以直接通过跳板机连接远程生产数据库，不需要手动运行 ssh -L
  >   >
  >   > * DDL/写操作精细控制
  >   >
  >   >   > * ALLOW_INSERT_OPERATION：是否允许 INSERT 
  >   >   > * ALLOW_UPDATE_OPERATION：是否允许 UPDATE
  >   >   > * ALLOW_DELETE_OPERATION：是否允许 DELETE
  >   >   > * MYSQL_DISABLE_READ_ONLY_TRANSACTIONS：允许 DDL（CREATE TABLE 等）
  >   >
  >   > * 多数据库/多项目支持：不设置 MYSQL_DB 就能列出所有数据库，一个 MCP 实例管理多个库。配合 Claude Code 的 project scope 可以给每个项目配不同的数据库连接
  >
  > * 提供的工具：连接成功后会提供以下 MCP 工具
  >
  >   >   - query：执行 SELECT 查询（只读）
  >   >   - execute：执行 INSERT/UPDATE/DELETE（需开启对应权限）
  >   >   - list_tables：列出所有表
  >   >   - describe_table：查看表结构
  >   >   - list_databases：列出所有数据库（多库模式下）

# 实际工具

## Skill

* find-skills：用于辅助 Agent 发现、搜索、评估和安装其他 Skills

## Plugin

* skill-creator：用于创建和优化 AI Agent Skills

* Superpowers：一组用于提升 AI Agent 工作质量的开发工作流技能集合

  > * 重点是让 Agent 像经验丰富的工程师一样工作，而不是直接开始写代码
  > * 技能 - Brainstorming：用于需求分析和方案探索
  > * 技能 - Writing Plans：用于生成实施计划
  > * 技能 - Executing Plans：负责按照计划执行
  > * 技能 - Verification Before Completion：Agent 在说“完成”之前必须 运行测试、检查构建、验证输出、确认验收标准满足
  > * 技能 - Finishing a Development Branch：开发结束后的收尾流程