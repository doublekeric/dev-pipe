---
name: init-project
description: "Initializes DevPipe for a new project. Activates when /pipe is first used or when .dev-pipe directory doesn't exist."
---

# Skill: init-project

## Purpose

Initialize DevPipe structure for a new project, creating knowledge base and workspace.

## Trigger

- First use of `/dev-pipe:pipe` in a project
- `.dev-pipe/` directory doesn't exist
- User runs `/dev-pipe:pipe init`

## Process

### Step 1: Check Existing Structure

Check if `.dev-pipe/` exists in the current project.

If exists → Offer to reinitialize or update.

### Step 2: Confirm Initialization

```
🚀 DevPipe Initialization

DevPipe needs to be set up for this project.

Initialize now? [yes/no]
```

### Step 3: Gather Project Information

Ask questions one at a time:

```
📝 Project Setup

1. Project name?
   > 

2. Project type?
   [1] Card RPG
   [2] Casual Game
   [3] Action Game
   [4] MMO
   [5] Other

3. Target platform?
   [1] iOS
   [2] Android
   [3] PC
   [4] Multi-platform

4. Game engine?
   [1] Unity (version?)
   [2] Unreal
   [3] Custom

5. Core gameplay loop?
   > (e.g., Draw → Build → Battle)
```

### Step 4: Create Directory Structure

```
.dev-pipe/
├── context/
│   ├── project/
│   ├── systems/
│   ├── tech/
│   ├── experience/
│   │   ├── bug/
│   │   ├── performance/
│   │   ├── feature/
│   │   └── process/
│   └── rules/
└── workspace/
```

### Step 5: Generate Files

From templates, generate:
- `.dev-pipe/context/project/overview.md`
- `.dev-pipe/context/rules/context-rules.md`
- `.dev-pipe/context/rules/risk-rules.md`
- `.dev-pipe/context/rules/pattern-rules.md`
- `.dev-pipe/workspace/index.md`

### Step 6: Update .gitignore

Append to .gitignore (if exists):

```
# DevPipe
.dev-pipe/workspace/
```

## Output

```
✅ DevPipe Initialized!

📁 Created:
.dev-pipe/
├── context/
│   ├── project/overview.md     ← Edit with your project info
│   ├── systems/                ← Add system docs here
│   ├── tech/                   ← Add tech guidelines here
│   ├── experience/             ← Lessons learned go here
│   └── rules/                  ← Mapping rules
└── workspace/                  ← Task state (gitignored)

🎯 Next Steps:
1. Review: .dev-pipe/context/project/overview.md
2. Add system docs as you develop
3. Start: /dev-pipe:pipe implement {your first feature}
```

## Template Files

Read from `templates/` directory and generate customized versions based on user input.
