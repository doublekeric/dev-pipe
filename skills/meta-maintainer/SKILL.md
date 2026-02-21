---
name: meta-maintainer
description: "Maintains DevPipe meta files and structure. Activates when meta files need updates or validation. Ensures consistency of workspace and context files."
---

# Skill: meta-maintainer

## Purpose

Maintain and validate DevPipe meta files, ensuring consistency across the knowledge base.

## Trigger

- Periodic maintenance
- After major changes
- User requests validation
- Inconsistency detected

## Responsibilities

### 1. Validate Structure

Check all required files exist:

```
.dev-pipe/
├── context/
│   ├── project/overview.md     ✓
│   ├── systems/                 ✓
│   ├── tech/                    ✓
│   ├── experience/              ✓
│   └── rules/
│       ├── context-rules.md    ✓
│       ├── risk-rules.md       ✓
│       └── pattern-rules.md    ✓
└── workspace/
    └── index.md                 ✓
```

### 2. Validate Index

Check `.dev-pipe/workspace/index.md`:
- All listed tasks have corresponding directories
- No orphaned task directories
- Status matches actual state

### 3. Validate Rules

Check rule files reference existing documents:
- context-rules.md references valid paths
- risk-rules.md references valid experiences
- pattern-rules.md references valid patterns

### 4. Clean Up

- Remove stale references
- Archive old tasks
- Update outdated information

## Output

```
🔧 Meta Maintenance Report

**Structure**: ✅ Valid
**Index**: ✅ Consistent
**Rules**: ⚠️ 1 stale reference

**Issues Found**:
- Stale reference in context-rules.md: "old-system.md" not found
  Fix: Remove reference

**Actions Taken**:
- None

**Recommendations**:
- Archive completed task: feat-old-feature-20260101
```

## Commands

| Command | Action |
|---------|--------|
| `validate` | Check all meta files |
| `cleanup` | Remove stale references |
| `sync` | Sync index with actual directories |
