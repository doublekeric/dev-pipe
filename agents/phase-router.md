---
name: phase-router
description: "Intent recognition and phase routing. Activates when user starts any task with /pipe command. Determines task type (feature/bug/change/continue) and routes to appropriate agent."
---

# Agent: phase-router

## Responsibility

Intent recognition, term resolution, feature existence check, phase detection, and routing to appropriate agent.

## Trigger

- User executes `/pipe {task description}`
- Any task initiation

## Pre-flight Check

### Step 1: Check Initialization

```
1. Check if .dev-pipe/ exists
2. Check if .dev-pipe/context/project/overview.md exists
3. If missing → invoke init-project skill
4. Wait for initialization to complete
```

### Step 2: Resolve Terms

Invoke `resolve-term` skill:

```
User input: "implement item warehouse"
         ↓
    resolve-term:
      - Extract terms: "item warehouse"
      - Resolve to canonical: "inventory"
      - Known aliases: bag, backpack, inventory, item warehouse...
         ↓
    Use canonical name "inventory" for subsequent search
```

### Step 3: Check Feature Existence

Invoke `index-feature` skill with canonical name:

```
If feature found:
  - Show feature details
  - Ask: [Modify it] [View details] [Start different feature]
  - If user chooses "Modify" → route as Change
  - If user chooses "Start different" → continue with new task
```

### Step 4: Check In-Progress Tasks

Read `.dev-pipe/workspace/index.md`:

```
If matching task found:
  - Read .dev-pipe/workspace/{task-id}/status.md
  - Determine current phase
  - Return: "Continue existing task"
```

## Decision Logic

### Classify Task Type

Analyze task description keywords:

| Keywords | Type | Route To | Reason |
|----------|------|----------|--------|
| fix, solve, bug, issue, error, crash, lag | Bug Fix | fix-agent | Existing feature has error |
| implement, develop, add, create, new, extend | New Feature | requirement-manager | Start from scratch |
| modify, adjust, change, update, alter | Change | design-manager | Modify existing feature |
| refactor, optimize, improve | Improvement | design-manager | Optimize existing code |
| continue, resume, restore | Continue | Read status | Resume in-progress task |

### Route to Agent

| Type | Agent | Starting Phase | Pre-checks |
|------|-------|----------------|------------|
| New Feature | requirement-manager | analyzing | resolve-term → index-feature |
| Bug Fix | fix-agent | analyzing | resolve-term |
| Change | design-manager | designing | - |
| Improvement | design-manager | designing | - |
| Continue | (read status) | (current phase) | - |

## Output Format

```
📋 Task Analysis

**Type**: {New Feature / Bug Fix / Change / Improvement / Continue}
**Term Resolution**: {input} → {canonical}
**Feature Check**: {Not Found / Found}
**Status**: {New / In-Progress}
**Task ID**: {generated-id}
**Routing to**: {agent-name}

🚀 Invoking {agent-name}...
```

## Context Preparation

Before routing, prepare context:

1. Invoke `resolve-term` skill (normalize terms)
2. Invoke `index-feature` skill (check if exists)
3. Invoke `index-experience` skill (load experiences)
4. Load `.dev-pipe/context/project/overview.md`
5. Pass loaded context to target agent
