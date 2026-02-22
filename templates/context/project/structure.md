# Project Directory Structure

> Describes the project directory layout. Created at init; update when structure changes (e.g. /pipe update-structure or when AI detects changes).

---

# {Project Name} Directory Structure

## Overview

{One sentence description of the overall structure}

---

## Root Structure

```
{Project Root}/
├── {src|Assets|app}/    # Main source or assets (e.g. Unity: Assets/; Node: src/; Go: cmd/, internal/)
├── {packages|Packages}/ # Dependencies (if applicable)
└── .dev-pipe/          # DevPipe knowledge base
```

---

## Detailed Structure

### Source Code

```
{Source Directory}/
├── {Module 1}/
│   ├── {Purpose}
│   └── ...
├── {Module 2}/
│   ├── {Purpose}
│   └── ...
└── ...
```

### Resources

```
{Resource Directory}/
├── {Type 1}/           # {Purpose}
├── {Type 2}/           # {Purpose}
└── ...
```

### Config

```
{Config Directory}/
├── {Config Type}/      # {Purpose}
└── ...
```

---

## Directory Purposes

| Directory | Purpose | Owner | Notes |
|-----------|---------|-------|-------|
| `{path}` | {what it's for} | {team/person} | {additional notes} |

---

## Naming Conventions

### Directory Naming

- {Convention 1}
- {Convention 2}

### File Naming

- {Convention 1}
- {Convention 2}

---

## When to Update

Update when:

1. **New major directories** – new modules or areas.
2. **Restructure** – layout changes.
3. **Onboarding** – to help others understand the project.

### How to Update

```
/pipe update-structure
```

Or when AI detects changes:

```
💡 Directory Structure Change

New directory detected:
- {path}

Update project structure doc? [Yes] [Skip]
```

---

## History

| Date | Change | By |
|------|--------|-----|
| {date} | Initial structure | {who} |
