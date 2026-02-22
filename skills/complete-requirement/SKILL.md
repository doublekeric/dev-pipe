---
name: complete-requirement
description: "Completes and finalizes a requirement. Activates when implementation is done and verified. Updates task status, registers feature and terms, and prepares for archival."
---

# Skill: complete-requirement

## Purpose

Finalize a completed requirement, register the feature and its terms to the knowledge base, and prepare for archival.

## Trigger

- Implementation complete
- Code committed
- User confirms task done

## Process

### Step 1: Verify Completion

Check:
- [ ] Implementation complete
- [ ] Code committed
- [ ] No critical issues

### Step 2: Determine Canonical Name

Invoke `resolve-term` to check if this feature already has a canonical name:

```
If canonical name exists:
  - Use existing canonical name
  - Add new aliases if user used different terms

If no canonical name:
  - Create new canonical name
  - Register user's term as first alias
```

### Step 3: Register Feature

Create `.dev-pipe/context/features/{canonical-name}.md`:

```markdown
# Feature: {Canonical Name}

## Metadata
- Status: Implemented
- Implemented Date: {date}
- Task ID: {task-id}
- Category: {system}
- Aliases: {user's term}, {other aliases}

## Description
{What this feature does}

## Capabilities
- {Capability 1}
- {Capability 2}

## Files
- `{file 1}`: {purpose}
- `{file 2}`: {purpose}

## Interfaces
- `{Method}()`: {description}

## History
- {date}: Initial implementation ({task-id})
```

### Step 4: Register Term Mappings

Update `.dev-pipe/context/rules/term-mappings.md`:

Add new aliases to existing entry:

```yaml
inventory:
  aliases:
    - 背包
    - 背包系统
    - 道具仓库          # ← 新增
    - inventory
```

Or create new entry:

```yaml
{canonical-name}:
  aliases:
    - {user's original term}
    - {suggested aliases}
  category: {system}
  description: {brief}
```

### Step 5: Update Status

Update `.dev-pipe/workspace/{task-id}/status.md`:

```markdown
# Task Status

- Task ID: {id}
- Description: {description}
- Type: feature
- Phase: completed
- Created: {datetime}
- Completed: {datetime}

## Summary

{What was implemented}

## Files Modified

- {file 1}
- {file 2}

## Registration

✅ Feature: .dev-pipe/context/features/{canonical-name}.md
✅ Terms: Added "{user's term}" → "{canonical-name}"
```

### Step 6: Update Workspace Index

Update `.dev-pipe/workspace/index.md`:
- Move from "In Progress" to "Completed"

### Step 7: Prompt Experience Deposit

Ask user if any lessons should be saved.

## Output

```
✅ Requirement Completed

**Task**: {task-id}
**Status**: Completed

**Feature Registered**:
📄 .dev-pipe/context/features/{canonical-name}.md

**Term Mappings**:
📝 "{user's term}" → "{canonical-name}"
   Known aliases: 背包, 背包系统, 道具仓库, inventory...

**Summary**:
{What was implemented}

**Files**: {n} files
**Commits**: {n} commits

**Next Steps**:
1. Save lessons learned? /remember {topic}
2. Archive task?
```

## Term Registration Details

### Why Register Terms?

确保不同角色用不同词汇描述时，都能找到同一功能：

| 场景 | 不注册术语 | 注册术语后 |
|------|-----------|-----------|
| 产品说"背包系统" | 注册为 "背包系统" | 注册为 inventory |
| 运营说"道具仓库" | 找不到，重复开发 | 找到 inventory，提示已存在 |
| 研发说"Inventory" | 找不到，重复开发 | 找到 inventory，提示已存在 |

### Term Collection

When registering, collect all known terms:

1. **User's original term**: What user called it
2. **Code names**: Class names, folder names
3. **Ask**: "其他团队怎么叫这个功能？"

```
📝 Term Registration

Your feature is called: "背包系统"

What other names might people use?
1. 产品团队怎么叫？
2. 运营团队怎么叫？
3. 代码里叫什么？

> 道具仓库
> 物品管理
> InventoryManager

Added 4 aliases:
- 背包系统
- 道具仓库
- 物品管理
- InventoryManager
```
