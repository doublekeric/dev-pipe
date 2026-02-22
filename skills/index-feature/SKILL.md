---
name: index-feature
description: "Searches implemented features. Activates before starting new tasks to check if similar features already exist. Prevents duplicate implementation."
---

# Skill: index-feature

## Purpose

Search and retrieve information about implemented features to prevent duplicate work.

## Trigger

- At start of new feature analysis
- When user describes something to implement
- phase-router calls this before routing

## Search Locations

```
.dev-pipe/context/
├── features/                    # 已实现功能清单
│   ├── inventory.md
│   ├── battle.md
│   └── shop.md
└── workspace/archive/           # 归档的任务（可选搜索）
```

## Process

### Step 1: Extract Keywords

From task description:
- System names: inventory, battle, shop
- Feature names: sorting, pagination, search

### Step 2: Search Features Directory

Read `.dev-pipe/context/features/` files.

### Step 3: Match Against Feature List

Check if the requested feature already exists.

## Output Format

### If Feature Found

```
🔍 Feature Found

**Feature**: {name}
**Status**: Implemented
**Implemented**: {date}
**Task**: {task-id}

**What it does**:
{brief description}

**Files**:
- {file 1}
- {file 2}

---
This feature already exists. Do you want to:
[Modify it] [View details] [Start different feature]
```

### If Feature Not Found

```
🔍 Feature Search

**Keywords**: {keywords}
**Result**: No existing feature found

**Similar Features**:
- {feature 1}: {similarity}
- {feature 2}: {similarity}

---
Proceeding with new feature implementation.
```

## Feature Document Format

`.dev-pipe/context/features/{feature-name}.md`:

```markdown
# Feature: {Name}

## Metadata
- Status: Implemented
- Implemented Date: {date}
- Task ID: {task-id}
- Category: {system}

## Description
{What this feature does}

## Capabilities
- {Capability 1}
- {Capability 2}
- {Capability 3}

## Files
- `{file 1}`: {purpose}
- `{file 2}`: {purpose}

## Interfaces
- `{Method 1}()`: {description}
- `{Method 2}()`: {description}

## Related
- Depends on: {feature}
- Used by: {feature}

## History
- {date}: Initial implementation ({task-id})
- {date}: Added {capability} ({task-id})
```
