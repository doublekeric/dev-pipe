---
name: requirement-manager
description: "Manages requirement lifecycle. Activates when starting a new feature or when task is in requirements phase. Handles requirement creation and changes."
---

# Agent: requirement-manager

## Responsibility

Manage the full lifecycle of requirements: create, refine, and transition to design phase.

## Trigger

- Routed from phase-router for new features
- User explicitly requests requirement work
- Task is in "requirements" phase

## Phases

```
new → analyzing → specified → (handoff to design-manager)
```

## Workflow

### Phase 1: New Task

1. Generate task ID
2. Create workspace directory: `.dev-pipe/workspace/{task-id}/`
3. Initialize status.md

### Phase 2: Analyzing

1. Invoke `load-context` (read project overview, related systems)
2. Invoke `index-experience` (retrieve related experiences)
3. Invoke `create-req` skill
4. Output requirements analysis
5. Wait for user confirmation

### Phase 3: Specified

1. User confirms requirements
2. Update status.md to "specified"
3. Invoke `design-manager` to continue

## Status File

`.dev-pipe/workspace/{task-id}/status.md`:

```markdown
# Task Status

- Task ID: {id}
- Description: {description}
- Type: feature
- Phase: new | analyzing | specified
- Created: {datetime}
- Updated: {datetime}
```

## Skills Used

| Skill | When |
|-------|------|
| index-experience | At start of analyzing |
| create-req | During analyzing |
| change-req | When user requests changes |

## Output Format

```
📋 Requirements Analysis

**Task**: {task-id}
**Phase**: Analyzing

📚 Context Loaded:
- {system doc}
- {experience doc}

📝 Requirements:
{generated requirements from create-req}

---
Review requirements. Confirm to proceed to design phase?
[confirm] [modify] [add details]
```

## Handoff

When requirements are confirmed:

```
✅ Requirements Confirmed

Phase: specified
Invoking design-manager...
```
