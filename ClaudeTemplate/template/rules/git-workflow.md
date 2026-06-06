---
description: Git 工作流规范，所有操作时自动加载
---

# Git 工作流规范

## 分支策略
- **main**: 稳定版本，可随时部署
- **develop**: 开发集成（可选，小项目可不用）
- **feature/<name>**: 新功能开发
- **fix/<name>**: Bug 修复
- **refactor/<name>**: 代码重构

## 提交信息格式

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**type 类型**:
| Type | 说明 |
|------|------|
| `feat` | 新功能 |
| `fix` | Bug 修复 |
| `refactor` | 重构（不改功能） |
| `test` | 添加/修改测试 |
| `docs` | 文档变更 |
| `chore` | 构建/工具变更 |

**示例**:
```
feat(user): add email verification

- 注册后发送验证邮件
- 验证链接24小时有效
- 增加邮箱验证状态检查

Closes #42
```

## 提交粒度
- 一次提交只包含一个逻辑变更
- 提交前确保代码编译通过
- WIP（Work In Progress）提交应 squashed 后再合并
