---
name: commit-code
description: "提交已完成的代码变更。在实现通过验证后激活。生成规范的提交信息并更新任务状态。"
---

# Skill: commit-code

## 目的

用规范的提交信息提交已完成的代码变更，并更新任务状态。

## 触发条件

- 实现已完成
- 测试通过（如有）
- 用户确认可以提交

## 流程

### 步骤 1：核对变更

列出所有已修改/新增的文件。

### 步骤 2：生成提交信息

格式：
```
{type}({scope}): {description}

Task: {task-id}

Changes:
- {change 1}
- {change 2}
```

类型：feat, fix, refactor, docs, test, chore

### 步骤 3：执行提交

```bash
git add {files}
git commit -m "{message}"
```

### 步骤 4：更新任务状态

更新 `.cantrip/workspace/{task-id}/status.md`：
- Phase: committed
- Commit hash: {hash}

## 输出

```
💾 代码已提交

**Commit**: {hash}
**Message**:
```
{type}({scope}): {description}

Task: {task-id}

Changes:
- {change 1}
- {change 2}
```

**Files**: {n} 个文件

下一步：
- 推送到远程
- 创建 Pull Request
- 更新工作区索引
```

## 提交信息模板

```
{type}({scope}): {简短描述}

需要时可写详细说明。

Task: {task-id}

Changes:
- {具体变更 1}
- {具体变更 2}

Related: #{issue 如有}
```
