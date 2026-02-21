---
name: code-commit
description: "Commits completed code changes. Activates after implementation is verified. Creates commit with proper message and updates task status."
---

# Skill: code-commit

## Purpose

Commit completed code changes with proper commit message and update task status.

## Trigger

- Implementation complete
- Tests passed (if applicable)
- User confirms ready to commit

## Process

### Step 1: Review Changes

List all modified/created files.

### Step 2: Generate Commit Message

Format:
```
{type}({scope}): {description}

Task: {task-id}

Changes:
- {change 1}
- {change 2}
```

Types: feat, fix, refactor, docs, test, chore

### Step 3: Execute Commit

```bash
git add {files}
git commit -m "{message}"
```

### Step 4: Update Task Status

Update `.dev-pipe/workspace/{task-id}/status.md`:
- Phase: committed
- Commit hash: {hash}

## Output

```
💾 Code Committed

**Commit**: {hash}
**Message**:
```
{type}({scope}): {description}

Task: {task-id}

Changes:
- {change 1}
- {change 2}
```

**Files**: {n} files

Next steps:
- Push to remote
- Create pull request
- Update workspace index
```

## Commit Message Template

```
{type}({scope}): {short description}

Detailed description if needed.

Task: {task-id}

Changes:
- {specific change 1}
- {specific change 2}

Related: #{issue if any}
```
