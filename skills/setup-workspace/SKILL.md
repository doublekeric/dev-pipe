---
name: setup-workspace
description: "Sets up development workspace. Activates when starting implementation to ensure environment is ready."
---

# Skill: setup-workspace

## Purpose

Verify and prepare the development workspace before implementation begins.

## Trigger

- Before implementation starts
- User explicitly requests environment check

## Process

### Step 1: Verify Project Structure

Check required directories exist:
- `.dev-pipe/workspace/`
- Source code directories

### Step 2: Verify Dependencies

Check for:
- Required packages
- Build tools
- Test frameworks

### Step 3: Verify Configuration

Check:
- Build configuration
- Test configuration
- Environment settings

### Step 4: Create Task Workspace

Create `.dev-pipe/workspace/{task-id}/` if not exists:
- `status.md`
- `notes.md`

## Output

```markdown
🔧 Workspace Setup

**Project Structure**: ✅ Valid
**Dependencies**: ✅ Installed
**Configuration**: ✅ Ready

**Task Workspace Created**:
📁 .dev-pipe/workspace/{task-id}/
├── status.md
└── notes.md

Ready for implementation.
```

## Error Handling

If issues found:

```markdown
⚠️ Workspace Issues

**Missing Dependencies**:
- {package}: Install with {command}

**Missing Configuration**:
- {config}: {how to create}

Resolve these before continuing?
[resolve automatically] [skip] [abort]
```
