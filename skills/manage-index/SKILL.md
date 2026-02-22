---
name: manage-index
description: "Manages workspace and context indexes. Activates when indexes need updates. Keeps task lists and context mappings current."
---

# Skill: manage-index

## Purpose

Maintain and update index files that track tasks and context mappings.

## Trigger

- Task created/completed/archived
- New experience saved
- Context files added/removed

## Indexes Managed

### 1. Task Index

`.dev-pipe/workspace/index.md`:

```markdown
# Task Index

## In Progress

- [feat-inventory-20260221](./feat-inventory-20260221/) - Inventory system (Phase: implementing)
- [fix-scroll-20260222](./fix-scroll-20260222/) - Scroll lag (Phase: analyzing)

## Completed

> Move here when task done

## Archived

> Move here after archival
```

### 2. Experience Index

`.dev-pipe/context/experience/INDEX.md` (optional):

```markdown
# Experience Index

## Bug
- [Quantity Overflow](./bug/quantity-overflow.md) - Inventory quantity exceeded int max

## Performance
- [Scroll Lag](./performance/scroll-lag.md) - UI scroll caused frame drops

## Feature
- ...

## Process
- ...
```

## Operations

### Add Task to Index

```markdown
Add to "In Progress":
- [{task-id}](./{task-id}/) - {description} (Phase: {phase})
```

### Update Task Phase

```markdown
Change:
- [feat-inventory-20260221](./feat-inventory-20260221/) - Inventory system (Phase: implementing)
To:
- [feat-inventory-20260221](./feat-inventory-20260221/) - Inventory system (Phase: verifying)
```

### Move to Completed

```markdown
Remove from "In Progress"
Add to "Completed":
- [feat-inventory-20260221](./archive/...) - Inventory system - Completed 2026-02-21
```

## Output

```
📋 Index Updated

**Task Index**:
- Added: {task-id}
- Updated: {task-id}
- Removed: {task-id}

**Current State**:
- In Progress: {n}
- Completed: {n}
- Archived: {n}
```
