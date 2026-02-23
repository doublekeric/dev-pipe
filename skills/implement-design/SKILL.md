---
name: implement-design
description: "Implements code based on technical design. Activates during implementation phase. Generates code step by step with user confirmation."
---

# Skill: implement-design

## Purpose

Implement code based on the approved technical design, one step at a time.

## Trigger

- Invoked by implementation-executor during "implementing" phase
- Design is confirmed and available

## Input

- Path to design.md
- Loaded code style guidelines
- Retrieved code patterns

## Process

### Step 1: Read Design

Load `.dev-pipe/workspace/{task-id}/design.md`

### Step 2: Read Implementation Plan

Extract ordered task list from design.

### Step 3: Implement Each Task

For each task:

1. **Show task description**
2. **Generate code**
3. **Preview code**
4. **Wait for confirmation**
5. **Save file**
6. **Update notes.md**

### Conventions: Where to Put Scripts

When the implementation involves **temporary or one-off scripts** (e.g. codegen `.bat`/`.sh`, generators):

- **Do not** create them under project source (e.g. `Tools/`, `Scripts/`, `client/`). That pollutes the repo and blurs the line between real tooling and temporary artifacts.
- **Do** create and run them in a **temporary directory**, e.g.:
  - `{project-root}/.tmp/` (ensure `.tmp/` is in `.gitignore`), or
  - System temp (`$TMPDIR` / `%TEMP%`).
- Only add scripts to `Tools/` (or similar) if they are **permanent project tooling** and will be committed and documented.

### Step 4: Handle Issues

If issues arise:
- Record in notes.md
- Offer to modify design
- Continue or pause

## Output Per Task

```
🔨 Task: {Task Description}

**File**: {path}

**Code**:
```{language}
{generated code}
```

---
Confirm this implementation?
[confirm] [modify] [skip]
```

## Notes Update

`.dev-pipe/workspace/{task-id}/notes.md`:

```markdown
# Implementation Notes

## Progress
- [x] {Task 1} - {File} - Complete
- [ ] {Task 2} - {File} - In Progress
- [ ] {Task 3} - Pending

## Issues
- {Issue}: {Resolution}

## Code Snippets
{Key patterns used}
```

## Final Output

```
✅ Implementation Complete

**Tasks Completed**: {n}/{total}
**Files Modified**: {list}
**Files Created**: {list}

**Summary**:
{Brief description of what was implemented}

Proceed to testing?
```
