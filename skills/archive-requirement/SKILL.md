---
name: archive-requirement
description: "Archives completed requirements. Activates after task is completed and user confirms archival. Moves task files to archive and updates index."
---

# Skill: archive-requirement

## Purpose

Archive a completed task, moving it out of the active workspace.

## Trigger

- Task completed
- User confirms archival
- Cleanup requested

## Process

### Step 1: Verify Completion Status

Read `.dev-pipe/workspace/{task-id}/status.md`:
- Confirm phase is "completed"

### Step 2: Create Archive

```bash
# Create archive directory
mkdir -p .dev-pipe/workspace/archive/{YYYY-MM}/

# Move task directory
mv .dev-pipe/workspace/{task-id}/ .dev-pipe/workspace/archive/{YYYY-MM}/
```

### Step 3: Update Index

Update `.dev-pipe/workspace/index.md`:
- Remove from "In Progress"
- Add to "Archived" with link

### Step 4: Keep Summary

Optionally keep a summary in main index:

```markdown
## Archived

- [feat-inventory-20260221](./archive/2026-02/feat-inventory-20260221/) - Inventory system - Completed 2026-02-21
```

## Output

```
📦 Requirement Archived

**Task**: {task-id}
**Archive Location**: .dev-pipe/workspace/archive/{date}/

**Workspace Updated**:
- Active tasks: {n}
- Archived: {n}

Task files preserved in archive for future reference.
```

## Archive Structure

```
.dev-pipe/workspace/
├── archive/
│   ├── 2026-02/
│   │   ├── feat-inventory-20260221/
│   │   │   ├── status.md
│   │   │   ├── spec.md
│   │   │   ├── design.md
│   │   │   └── notes.md
│   │   └── fix-scroll-20260222/
│   └── 2026-03/
├── index.md
└── {active-task-id}/
```
