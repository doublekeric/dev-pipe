---
name: phase-router
description: "Intent recognition and phase routing. Activates when user starts any task with /pipe command. Determines task type (feature/bug/continue) and routes to appropriate agent."
---

# Agent: phase-router

## Responsibility

Intent recognition, phase detection, and routing to appropriate agent.

## Trigger

- User executes `/pipe {task description}`
- Any task initiation

## Pre-flight Check

### DevPipe Initialization Check

Before any routing:

```
1. Check if .dev-pipe/ exists
2. Check if .dev-pipe/context/project/overview.md exists
3. If missing → invoke project-init skill (separate from main skills)
4. Wait for initialization to complete
5. Then continue routing
```

## Decision Logic

### Step 1: Check In-Progress Tasks

Read `.dev-pipe/workspace/index.md`:

```
If matching task found:
  - Read .dev-pipe/workspace/{task-id}/status.md
  - Determine current phase
  - Return: "Continue existing task"
```

### Step 2: Classify Task Type

Analyze task description keywords:

| Keywords | Type | Route To |
|----------|------|----------|
| 修复, 解决, bug, 问题, 报错, 崩溃, 卡顿 | Bug Fix | fix-agent (external, not in this skill set) |
| 实现, 开发, 添加, 新增, 创建, 扩展 | New Feature | requirement-manager |
| 继续, 接着, 恢复 | Continue | Read status, route to current agent |
| 重构, 优化, 改进 | Improvement | requirement-manager |

### Step 3: Route to Agent

Based on classification, invoke the appropriate agent:

- **New Feature** → requirement-manager
- **Continue Task** → Agent based on current phase
- **Bug Fix** → fix-agent (placeholder for future)

## Output Format

```
📋 Task Analysis

**Type**: {Feature/Bug/Continue}
**Status**: {New/In-Progress (Phase: xxx)}
**Task ID**: {generated-id}
**Routing to**: {agent-name}

🚀 Invoking {agent-name}...
```

## Task ID Generation

```
Format: {type}-{brief-desc}-{YYYYMMDD}
Examples:
  feat-inventory-system-20260221
  fix-scroll-lag-20260221
```

## Context Preparation

Before routing, prepare context:

1. Invoke `experience-index` skill with task keywords
2. Load `.dev-pipe/context/project/overview.md`
3. Pass loaded context to target agent
