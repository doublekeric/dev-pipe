---
name: design-create
description: "Creates technical design document. Activates when design-manager starts designing after requirements are confirmed. Generates architecture, data structures, and implementation plan."
---

# Skill: design-create

## Purpose

Generate a technical design document based on approved requirements.

## Trigger

- Invoked by design-manager during "designing" phase
- Requirements are confirmed and available

## Input

- Path to spec.md
- Loaded tech guidelines
- Retrieved experiences

## Process

### Step 1: Read Requirements

Load `.dev-pipe/workspace/{task-id}/spec.md`

### Step 2: Design Architecture

- Module structure
- Layer separation
- Dependencies

### Step 3: Design Data Structures

- New data types
- Modified data types
- Storage considerations

### Step 4: Design Interfaces

- Public APIs
- Event contracts
- Integration points

### Step 5: Create Implementation Plan

- Break into tasks
- Order by dependencies
- Estimate effort

### Step 6: Identify Risks

Based on:
- Retrieved experiences
- Technical complexity
- Integration challenges

## Output

`.dev-pipe/workspace/{task-id}/design.md`:

```markdown
# Technical Design: {Feature Name}

## Overview
{Brief description}

## Architecture

### Module Structure
```
{Module}/
├── {File1}.cs    # {Purpose}
├── {File2}.cs    # {Purpose}
└── {File3}.cs    # {Purpose}
```

### Dependencies
- {Module A} → {Module B}: {Why}

## Data Structures

### {Structure Name}
```csharp
public class {Name} {
    public {Type} {Field};  // {Purpose}
}
```

## Interfaces

### I{InterfaceName}
```csharp
public interface I{Name} {
    {Return} {Method}({Params});  // {Purpose}
}
```

## Implementation Plan

### Phase 1: {Name}
- [ ] {Task 1} - {Estimate}
- [ ] {Task 2} - {Estimate}

### Phase 2: {Name}
...

## Risk Assessment

| Risk | Level | Mitigation |
|------|-------|------------|
| {Risk} | high/medium/low | {Mitigation} |

## Testing Strategy

- Unit tests: {What to test}
- Integration tests: {What to test}

## References

- {Experience 1}
- {Guideline 1}
```

## Output Format

```
📐 Technical Design Created

**File**: .dev-pipe/workspace/{task-id}/design.md

**Summary**:
- Modules: {n}
- Tasks: {n}
- High risks: {n}

Review design and confirm to proceed to implementation.
```
