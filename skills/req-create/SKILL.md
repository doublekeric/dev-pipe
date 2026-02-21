---
name: req-create
description: "Creates new requirement specification. Activates when requirement-manager starts analyzing a new feature. Generates structured requirement document."
---

# Skill: req-create

## Purpose

Generate a structured requirement specification for a new feature.

## Trigger

- Invoked by requirement-manager during "analyzing" phase

## Input

- Task description
- Loaded context (project overview, related systems)
- Retrieved experiences

## Process

### Step 1: Analyze Requirements

Break down the task into:
- Core functionality
- Edge cases
- Integration points
- Constraints

### Step 2: Identify Affected Systems

List systems that:
- Will be modified
- Will be queried
- Will be notified

### Step 3: Generate Spec Document

## Output

`.dev-pipe/workspace/{task-id}/spec.md`:

```markdown
# Requirement Specification: {Feature Name}

## Overview
{One sentence description}

## Functional Requirements

### F1: {Feature Name}
**Description**: {What it does}
**Acceptance Criteria**:
- [ ] {Criteria 1}
- [ ] {Criteria 2}

### F2: {Feature Name}
...

## Data Requirements

**New Data**:
- {Data 1}: {Description}

**Modified Data**:
- {Data 2}: {Changes}

## Integration Points

| System | Interaction |
|--------|-------------|
| {System A} | {How it interacts} |

## Constraints

- {Constraint 1}
- {Constraint 2}

## Questions for Clarification

1. {Question 1}
2. {Question 2}

## Related Experience

- {Experience 1}
- {Experience 2}
```

## Output Format

```
📝 Requirement Spec Created

**File**: .dev-pipe/workspace/{task-id}/spec.md

**Summary**:
- Functional requirements: {n}
- Affected systems: {list}
- Open questions: {n}

Review and confirm to proceed.
```
