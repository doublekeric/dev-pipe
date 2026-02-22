---
name: update-knowledge
description: "Detects and prompts to save project knowledge during development. Handles directory structure, environment config, tech guidelines, and other project context."
---

# Skill: update-knowledge

## Purpose

Detect changes and considerations worth saving as project knowledge during development:
- Directory structure
- Environment configuration
- Tech checklists
- Other project context

## Trigger

- During development (design, implementation)
- Changes detected
- User mentions patterns
- New directories accessed
- Environment changes mentioned

## Scope

**Updates**:

| File | Content | When |
|------|---------|------|
| `project/structure.md` | Directory structure | New dirs, purpose changes |
| `project/environment.md` | Environment config | Server, tools, config changes |
| `tech/tech-guidelines.md` | Dev checklists | Patterns found, lessons learned |

**Does NOT update** (handled by other skills):
- `experience/` - Handled by experience-depositor
- `features/` - Handled by complete-requirement
- `rules/term-mappings.md` - Auto-learned by resolve-term

## Detection & Prompts

### Directory Structure

```
Trigger: New directory accessed, not in structure.md

📁 Directory Structure Change

Detected new directory: Assets/Scripts/Achievement/

What is this directory for?
> Achievement system related code

Update project structure doc?
[Update] [Skip]
```

### Environment Config

```
Trigger: User mentions environment change

🔧 Environment Change

You mentioned the test server address changed.

Update environment config doc?
[Update] [Skip]
```

### Tech Guidelines

```
Trigger: Recurring pattern detected, same check performed multiple times

💡 Tech Guideline Suggestion

I noticed this project frequently needs to confirm:
- "Are art assets ready?"

Add to UI development checklist?
[Add] [Skip]
```

### New Tool

```
Trigger: User used a new tool

🛠 New Tool Detected

You just used Docker.
This tool is not recorded in the project.

Add to environment config?
[Add] [Skip]
```

## Process

### Step 1: Detect Change Type

```
Detect change type:
- Directory change → structure.md
- Environment change → environment.md
- Pattern/checklist → tech-guidelines.md
```

### Step 2: Check if Documented

```
If already documented:
  - Don't prompt
Else:
  - Prompt to save
```

### Step 3: Prompt User

Show appropriate prompt based on change type.

### Step 4: Save to Correct File

Update the corresponding file based on change type.

## Manual Commands

```
/pipe update-knowledge        # Interactive update all knowledge
/pipe update-structure        # Update directory structure only
/pipe update-environment      # Update environment config only
/pipe update-guidelines       # Update checklists only
```

## Integration Points

### In implement-design

When creating new files or noticing patterns, prompt to save knowledge.

### In complete-requirement

After task completion, review and prompt to save any new knowledge.

## Output

```
📝 Project Knowledge Updated

**Updated Files**:
- project/structure.md: Added Assets/Scripts/Achievement/
- tech/tech-guidelines.md: Added "Art assets check"

**Summary**:
- Directories: +1
- Guidelines: +1
```

## Distinction from Other Skills

| Skill | What It Handles | Special |
|-------|-----------------|---------|
| **update-knowledge** | Structure, environment, checklists | Accumulated during dev |
| **experience-depositor** | Bug lessons | context: fork |
| **complete-requirement** | Feature records, terms | At task completion |
| **resolve-term** | Term mappings | Auto-learned |
