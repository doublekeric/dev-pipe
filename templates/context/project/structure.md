# Project Directory Structure

> 此文件描述项目的目录结构，在初始化时创建，后续可更新。
> 当目录结构变化时，通过 /pipe update-structure 或自动检测更新。

---

# {Project Name} Directory Structure

## Overview

{One sentence description of the overall structure}

---

## Root Structure

```
{Project Root}/
├── Assets/              # Unity 资源（如果是 Unity 项目）
├── Packages/            # 包管理
├── ProjectSettings/     # 项目设置
└── .dev-pipe/          # DevPipe 知识库
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

此文件应在以下情况更新：

1. **新增主要目录** - 添加新模块
2. **目录重构** - 结构调整
3. **新成员加入** - 帮助理解项目

### How to Update

```
/pipe update-structure
```

或让 AI 自动检测：

```
💡 Directory Structure Change

检测到新目录：
- Assets/Scripts/NewModule/

是否更新项目结构文档？
[更新] [跳过]
```

---

## History

| Date | Change | By |
|------|--------|-----|
| {date} | Initial structure | {who} |
