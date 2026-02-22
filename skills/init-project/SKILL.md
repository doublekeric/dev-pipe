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

### Step 2.5: Discover Project Content (Before Asking)

**Before asking any project questions**, scan the project root (and one level of key directories) to see what already exists. Use this to decide *how* to ask, not whether to ask.

**What to look for (examples):**

| If you find… | Likely context | Use for follow-up |
|--------------|----------------|--------------------|
| `Assets/`, `ProjectSettings/`, `Packages/`, `*.csproj` | Unity client | Ask project name, confirm "Unity project", optional: game type, target platform, gameplay loop |
| `Source/`, `*.uproject`, `Content/` | Unreal project | Same idea, confirm Unreal and optionally game type/platform |
| `go.mod`, `main.go`, `cmd/` | Go backend/service | Ask name, one-line description, confirm "Go service/backend"; skip game-engine questions |
| `package.json`, `node_modules/` | Node/JS/TS | Ask name, description; optional: frontend vs backend vs tool |
| `pyproject.toml`, `requirements.txt` | Python project | Ask name, description; optional: app vs script vs service |
| `pom.xml`, `build.gradle` | Java/JVM | Ask name, description and role of repo |
| Mixed (e.g. Unity + server folder) | Multi-repo or full-stack | Ask name, then "client / server / both / tool" and tailor next questions |
| Almost empty or only README | New or placeholder repo | Use **universal questions only** (see below) |

**Rule:** If the project already has clear structure and files, **ask questions that refer to what you found** (e.g. "I see a Unity project here. What's the project name? Is this a game client? If so, what type—e.g. MMO, action, casual—or skip with 'other'?"). If the project is empty or ambiguous, **do not ask game-specific or engine-specific questions**; use the universal set.

### Step 3: Gather Project Information

**When the project has discoverable content:**  
Ask in order, **based on what you discovered** (confirm or correct):

- Project name (required).
- Confirm or correct the detected context (e.g. "Unity game client", "Go backend", "Node tool").
- Only if relevant to the detected context: game type, target platform, engine version, or core loop. Let the user skip or say "other"/"N/A".
- Optionally: development stage, main tech stack (can be short).

**When the project is empty or you found little:**  
Use **universal questions only** (no game/engine-specific options):

```
📝 Project Setup (universal)

1. Project name?
   > 

2. In one line, what is this project? (e.g. "Unity game client", "Go matchmaking service", "Node CLI tool")
   > 

3. Main tech or stack? (optional, e.g. "Unity 2022", "Go 1.21", "Node + React")
   > 

4. Anything else you want DevPipe to know? (optional, or "no")
   >
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

Read from `templates/` directory. When generating `.dev-pipe/context/project/overview.md`:

- **Pre-fill** from discovery (e.g. detected "Unity" → set Game Engine; detected "Go" → set Server language) and from user answers.
- **Omit or collapse** sections that don't apply (e.g. no "Core Gameplay Loop" for a non-game repo; no "Game Engine" for a backend-only repo). The overview template has optional blocks for this.
