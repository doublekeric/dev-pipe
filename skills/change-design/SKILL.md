---
name: change-design
description: "Modifies existing technical design. Activates when design needs adjustment during implementation or when new constraints emerge."
---

# Skill: change-design

## Purpose

Modify an existing technical design based on implementation feedback or requirement changes.

## Trigger

- User requests design changes
- Implementation reveals issues
- New constraints discovered

## Input

- Path to existing design.md
- Change description
- Reason for change

## Process

### Step 1: Read Existing Design

Load `.dev-pipe/workspace/{task-id}/design.md`

### Step 2: Assess Impact

- Which modules affected
- Which tasks need revision
- Impact on timeline

### Step 3: Apply Changes

Update:
- Architecture (if needed)
- Data structures
- Interfaces
- Implementation plan

### Step 4: Update Risk Assessment

Re-evaluate risks based on changes.

## Output

Updated `.dev-pipe/workspace/{task-id}/design.md`:

```markdown
# Technical Design: {Feature Name}

> **Last Updated**: {datetime}
> **Change**: {description}

## Change History

| Date | Change | Impact |
|------|--------|--------|
| {date} | {description} | {modules affected} |

## Overview
...

## Architecture
...
```

## Output Format

```
📐 Design Updated

**Changes**:
- Architecture: {change or "none"}
- Data structures: {change or "none"}
- Tasks affected: {n}

**New Risks**:
- {Risk if any}

**Implementation Impact**:
- Tasks to redo: {list}
- Tasks to add: {list}

Review changes.
```
