---
name: create-design
description: "Creates technical design document. Activates when design-manager starts designing after requirements are confirmed. Generates architecture, data structures, and implementation plan. Auto-loads tech stack guidelines."
---

# Skill: create-design

## Purpose

Generate a technical design document based on approved requirements, incorporating tech stack specific guidelines.

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

### Step 2: Load Tech Guidelines

Load tech guidelines **that exist** under `.dev-pipe/context/tech/` and that match the project context:

- **Always consider**: `tech-guidelines.md`, `code-style.md` (if present).
- **Conditional**: Load stack- or domain-specific files only when they exist **and** match `.dev-pipe/context/project/overview.md` (e.g. `frontend.md`, `backend.md`, `unity.md`, `unreal.md`). Do not assume every project has Unity or a game engine.
- **Spec-based**: If the spec mentions UI, screens, or panels → also load frontend-related guidelines if present. If it mentions database, API, or services → load backend-related guidelines if present.

Do not hardcode "Unity" or "game type"; use whatever tech files the project has documented.

### Step 3: Design Architecture

- Module structure
- Layer separation
- Dependencies

### Step 4: Design Data Structures

- New data types
- Modified data types
- Storage considerations

### Step 5: Design Interfaces

- Public APIs
- Event contracts
- Integration points

### Step 6: Create Implementation Plan

- Break into tasks
- Order by dependencies
- Estimate effort

### Step 7: Apply Tech Checklist

Apply checklists from the loaded tech guidelines. If the project has custom checklists in `.dev-pipe/context/tech/`, use those. Otherwise, consider these **only when relevant to the spec**:

**If the spec involves UI / frontend / screens**:
- [ ] UI hierarchy and ownership clear?
- [ ] Art or asset requirements?
- [ ] Animation or motion requirements?
- [ ] Audio or feedback?

**If the spec involves data / storage / API**:
- [ ] Schema or table changes needed?
- [ ] Caching or invalidation?
- [ ] Transactions or consistency?

### Step 8: Identify Risks

Based on:
- Retrieved experiences
- Technical complexity
- Integration challenges
- Tech stack specific risks

## Output

`.dev-pipe/workspace/{task-id}/design.md`:

```markdown
# Technical Design: {Feature Name}

## Overview
{Brief description}

## Tech Guidelines Applied

**Loaded**: {tech guideline files}

**Checklist**:
- [ ] {Tech checklist item 1}
- [ ] {Tech checklist item 2}

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

## Tech Stack Considerations

### Frontend / Client (if applicable)
- Resources needed: {e.g. UI, assets, art}
- Animation / motion: {description}
- Performance concerns: {description}

### Backend (if applicable)
- Database changes: {description}
- API endpoints: {list}
- Caching strategy: {description}

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
- {Tech Guideline 1}
```

## Output Format

```
📐 Technical Design Created

**File**: .dev-pipe/workspace/{task-id}/design.md

**Tech Guidelines Loaded**:
- {List only the files actually loaded, e.g. tech-guidelines.md, code-style.md, and any stack-specific files present for this project}

**Summary**:
- Modules: {n}
- Tasks: {n}
- High risks: {n}
- Tech checklist items: {n}

**Questions**:
- {Question from tech guidelines}
- {Question from tech guidelines}

Review design and confirm to proceed to implementation.
```

## Tech Guidelines Loading Logic

### Detection Rules

| If spec suggests | Load (if file exists) |
|------------------|------------------------|
| UI, screens, panels, frontend | frontend.md or similar |
| Database, API, services, backend | backend.md or similar |
| Animation, effects, client assets | frontend / client guidelines |
| Network, requests | backend / API guidelines |
| Performance | tech-guidelines.md or performance section |

### Context-Based Loading

Read `.dev-pipe/context/project/overview.md` to see the project’s tech stack. Load only guideline files that **exist** under `.dev-pipe/context/tech/` and match that stack (e.g. if overview says "Go backend", load `backend.md` if present; if "Unity client", load `unity.md` or frontend file if present). Do not assume Unity or a specific engine.
