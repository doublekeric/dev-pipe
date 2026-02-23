---
name: dev-pipe
description: "DevPipe workflow entry point. Use when user says 'use dev-pipe', 'with dev-pipe flow', 'implement/develop/add/create feature', 'fix/solve bug', 'modify/change/update', 'optimize/improve', or 'remember/save experience'. Routes to appropriate workflow based on task type."
---

# DevPipe Entry Point

DevPipe is a development workflow system that manages requirements, technical design, code implementation, bug fixes, and experience deposition.

## When to Use This Skill

Activate this skill when:
- User says "use dev-pipe" or "with dev-pipe"
- User starts a development task: "implement/develop/add/create/new"
- User reports a bug: "fix/solve/bug/issue/error"
- User wants to modify: "modify/adjust/change/update"
- User wants to improve: "refactor/optimize/improve"
- User wants to save experience: "remember/save/record experience/lesson"

**Important**: Within the same conversation, once DevPipe is activated, subsequent messages are treated as continuation of the current task. No need to repeat "use dev-pipe" unless starting a completely new task.

## First-Time Setup

1. Check if `.dev-pipe/` directory exists
2. If not, run initialization:
   - Create `.dev-pipe/context/` structure
   - Create `.dev-pipe/workspace/` structure
   - Gather project information through questions
3. Wait for initialization to complete before proceeding

## Task Type Classification

Analyze user's input to determine task type:

| Keywords | Type | Route To |
|----------|------|----------|
| implement, develop, add, create, new, extend | New Feature | requirement-manager |
| fix, solve, bug, issue, error, crash, lag | Bug Fix | fix-agent |
| modify, adjust, change, update, alter | Change | design-manager |
| refactor, optimize, improve | Improvement | design-manager |
| continue, resume, restore | Continue | Read status and continue |
| remember, save experience, record lesson | Experience | experience-depositor |

## Workflow

### Step 1: Resolve Terms

Convert user terms to canonical project names:
- User says "backpack" → canonical: "inventory"
- User says "item warehouse" → canonical: "inventory"
- Check `.dev-pipe/context/rules/term-mappings.md` for known mappings

### Step 2: Check Feature Existence

Search `.dev-pipe/context/features/` for the canonical name:
- If found: Ask user whether to [Modify] [View details] [Start different feature]
- If not found: Proceed with new feature workflow

### Step 3: Check In-Progress Tasks

Read `.dev-pipe/workspace/index.md`:
- If matching in-progress task found: Offer to continue
- If new task: Create new task workspace

### Step 4: Route to Appropriate Agent

Based on task type, delegate to the appropriate sub-agent:

| Task Type | Sub-Agent | Starting Phase |
|-----------|-----------|----------------|
| New Feature | requirement-manager | analyzing |
| Bug Fix | fix-agent | analyzing |
| Change | design-manager | designing |
| Improvement | design-manager | designing |
| Continue | (read status) | (current phase) |
| Experience | experience-depositor | collecting |

## Output Format

```
📋 Task Analysis

**Type**: {New Feature / Bug Fix / Change / Improvement / Continue / Experience}
**Term Resolution**: {user term} → {canonical name}
**Feature Check**: {Not Found / Found}
**Status**: {New / In-Progress}
**Task ID**: {generated-id}
**Routing to**: {agent-name}

🚀 Proceeding with {agent-name}...
```

## Sub-Agents Reference

- **phase-router**: Intent recognition and routing (this skill covers its logic)
- **requirement-manager**: Requirements analysis and specification
- **design-manager**: Technical design and architecture
- **implementation-executor**: Code implementation
- **fix-agent**: Bug fixing workflow
- **experience-depositor**: Saving lessons learned

## Conversation Continuity

Once DevPipe is activated in a conversation:
- All subsequent messages are part of the current task
- User can say "continue", "next step", "modify this" without repeating "dev-pipe"
- Task status is persisted in `.dev-pipe/workspace/{task-id}/status.md`
- Only say "use dev-pipe" again when starting a completely new task
