---
name: experience-index
description: "Retrieves relevant experiences from knowledge base. Activates at the start of every task phase to load related lessons learned and prevent repeat mistakes."
---

# Skill: experience-index

## Purpose

Search and retrieve relevant experiences from the knowledge base based on task context.

## Trigger

- At start of any task phase (routing, analyzing, designing, implementing)
- Before making decisions
- User explicitly requests history

## Input

- Keywords from task description
- Current phase context
- System names involved

## Search Locations

```
.dev-pipe/context/
├── experience/
│   ├── bug/
│   ├── performance/
│   ├── feature/
│   └── process/
└── rules/
    ├── context-rules.md
    ├── risk-rules.md
    └── pattern-rules.md
```

## Process

### Step 1: Extract Keywords

From task description:
- System names: inventory, battle, shop
- Technical terms: ui, network, performance
- Action verbs: add, fix, optimize

### Step 2: Match Against Rules

Read `context/rules/context-rules.md`:

```markdown
inventory, item, bag:
  - context/systems/inventory.md
  - context/experience/bug/inventory-*.md
```

### Step 3: Load Matching Files

Read matched files and extract relevant sections.

### Step 4: Check Risk Rules

Read `context/rules/risk-rules.md` for warnings:

```markdown
item, add, quantity:
  - level: high
  - message: Check for overflow before adding
```

## Output Format

```
📚 Experience Index

**Keywords**: {keyword list}

**Related Experiences**:
1. {Title}
   > {Summary}
   Location: context/experience/{path}

**Risk Warnings**:
⚠️ [{level}] {warning message}

**Suggested Patterns**:
✅ {pattern name}: {brief description}

**Context to Load**:
- {file path 1}
- {file path 2}
```

## Return Value

Structured data for calling agent:

```json
{
  "experiences": [
    {"title": "...", "summary": "...", "path": "..."}
  ],
  "risks": [
    {"level": "high", "message": "..."}
  ],
  "patterns": [
    {"name": "...", "description": "..."}
  ],
  "context_files": ["path1", "path2"]
}
```
