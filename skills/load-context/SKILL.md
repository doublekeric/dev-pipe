---
name: load-context
description: "Loads project context for the current task. Reads project overview, system docs, and tech guidelines based on keywords."
---

# Skill: load-context

## Purpose

Load relevant context files based on task keywords, helping Claude understand the project.

## Trigger

- At the start of any task
- Before analysis or design phases

## Process

### Step 1: Read Project Overview

```bash
# Check if project is initialized
if [ -f ".dev-pipe/context/project/overview.md" ]; then
  cat .dev-pipe/context/project/overview.md
else
  echo "Project not initialized. Run /dev-pipe:pipe init first."
fi
```

### Step 2: Match Keywords to Systems

Read `.dev-pipe/context/rules/context-rules.md` to find relevant system docs.

### Step 3: Load System Documentation

For each matching system, load `.dev-pipe/context/systems/{system}.md`

### Step 4: Load Tech Guidelines

Load relevant tech guidelines from `.dev-pipe/context/tech/`

## Output

```
📚 Context Loaded

**Project**: {name}
**Type**: {project type or one-line description from overview}

**Related Systems**:
- {System A}: {brief summary}
- {System B}: {brief summary}

**Tech Guidelines**:
- {Guideline 1}
- {Guideline 2}
```
