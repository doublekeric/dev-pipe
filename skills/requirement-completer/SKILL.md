---
name: requirement-completer
description: "Completes and finalizes a requirement. Activates when implementation is done and verified. Updates task status and prepares for archival."
---

# Skill: requirement-completer

## Purpose

Finalize a completed requirement, update status, and prepare for archival.

## Trigger

- Implementation complete
- Code committed
- User confirms task done

## Process

### Step 1: Verify Completion

Check:
- [ ] Implementation complete
- [ ] Tests passed
- [ ] Code committed
- [ ] Documentation updated

### Step 2: Update Status

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

## Lessons Learned

- {lesson 1}
- {lesson 2}
```

### Step 3: Update Workspace Index

Update `.dev-pipe/workspace/index.md`:
- Move from "In Progress" to "Completed"

### Step 4: Prompt Experience Deposit

Ask user if any lessons should be saved:

```
✅ Task Completed

**Task**: {task-id}
**Summary**: {what was done}

Any lessons learned to save?
/remember {suggested topic}
```

## Output

```
✅ Requirement Completed

**Task**: {task-id}
**Status**: Completed

**Summary**:
{What was implemented}

**Files**: {n} files
**Commits**: {n} commits

**Next Steps**:
1. Archive task? (removes from active list)
2. Save lessons learned? /remember {topic}
```
