---
name: req-change
description: "Modifies existing requirement specification. Activates when user requests changes to requirements or when new information emerges during analysis."
---

# Skill: req-change

## Purpose

Modify an existing requirement specification based on user feedback or new information.

## Trigger

- User requests changes to requirements
- New constraints discovered
- Scope adjustment needed

## Input

- Path to existing spec.md
- Change description
- Reason for change

## Process

### Step 1: Read Existing Spec

Load `.dev-pipe/workspace/{task-id}/spec.md`

### Step 2: Apply Changes

- Add new requirements
- Modify existing requirements
- Remove obsolete requirements
- Update affected systems list

### Step 3: Track Changes

Record change history in spec.

## Output

Updated `.dev-pipe/workspace/{task-id}/spec.md`:

```markdown
# Requirement Specification: {Feature Name}

> **Last Updated**: {datetime}
> **Change**: {description}

## Change History

| Date | Change | Reason |
|------|--------|--------|
| {date} | {description} | {reason} |

## Overview
...

## Functional Requirements
...
```

## Output Format

```
📝 Requirement Spec Updated

**Changes**:
- Added: {requirement}
- Modified: {requirement}
- Removed: {requirement}

**Impact**:
- Affected systems: {list}
- Design impact: {description}

Review changes.
```
