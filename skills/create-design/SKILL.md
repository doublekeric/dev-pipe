---
name: create-design
description: "创建技术设计文档。在 design-manager 于需求确认后开始设计时激活。生成架构、数据结构与实现计划，并自动加载技术栈规范。"
---

# Skill: create-design

## 目的

根据已确认的需求生成技术设计文档，并纳入技术栈相关规范。

## 触发条件

- 由 design-manager 在「designing」阶段调用
- 需求已确认且可获取

## 输入

- spec.md 路径
- 已加载的技术规范
- 检索到的经验

## 流程

### 步骤 1：读取需求

加载 `.cantrip/workspace/{task-id}/spec.md`

### 步骤 2：加载技术规范

仅加载 `.cantrip/context/tech/` 下**存在**且与项目语境**匹配**的规范：

- **始终考虑**：`tech-guidelines.md`、`code-style.md`（若存在）。
- **按需加载**：仅当文件存在且与 `.cantrip/context/project/overview.md` 匹配时，加载栈/领域相关文件（如 `frontend.md`、`backend.md`、`unity.md`、`unreal.md`）。不要假定所有项目都是 Unity 或游戏引擎。
- **按 spec**：若 spec 提到 UI、界面、面板 → 有则加载前端相关规范；提到数据库、API、服务 → 有则加载后端相关规范。

不要写死「Unity」或「游戏类型」；只使用项目已文档化的技术文件。

### 步骤 3：设计架构

- 模块结构
- 分层
- 依赖关系

### 步骤 4：设计数据结构

- 新增数据类型
- 修改的数据类型
- 存储考量

### 步骤 5：设计接口

- 对外 API
- 事件约定
- 集成点

### 步骤 6：制定实现计划

- 拆分为任务
- 按依赖排序
- 估时

### 步骤 7：应用技术检查清单

使用已加载技术规范中的检查清单。若项目在 `.cantrip/context/tech/` 下有自定义清单，用该清单；否则仅在**与 spec 相关**时参考以下项：

**若 spec 涉及 UI / 前端 / 界面**：
- [ ] UI 层级与归属是否清晰？
- [ ] 美术或资源需求？
- [ ] 动效或动画需求？
- [ ] 音效或反馈？

**若 spec 涉及数据 / 存储 / API**：
- [ ] 是否需要 schema 或表结构变更？
- [ ] 缓存或失效策略？
- [ ] 事务或一致性？

### 步骤 8：识别风险

基于：
- 检索到的经验
- 技术复杂度
- 集成难点
- 技术栈相关风险

## 输出

`.cantrip/workspace/{task-id}/design.md`：

```markdown
# Technical Design: {Feature Name}

## Overview
{简要描述}

## Tech Guidelines Applied

**Loaded**: {tech guideline files}

**Checklist**:
- [ ] {Tech checklist item 1}
- [ ] {Tech checklist item 2}

## Architecture

### Module Structure
...
### Dependencies
...

## Data Structures
...

## Interfaces
...

## Tech Stack Considerations
...

## Implementation Plan
...

## Risk Assessment
...

## Testing Strategy
...

## References
...
```

## 输出格式

```
📐 技术设计已创建

**文件**: .cantrip/workspace/{task-id}/design.md

**已加载技术规范**:
- {仅列出实际加载的文件}

**摘要**:
- 模块: {n}
- 任务: {n}
- 高风险: {n}
- 技术检查项: {n}

**待确认**:
- {来自技术规范的问题}

请审阅设计并确认后进入实现。
```

## 技术规范加载逻辑

阅读 `.cantrip/context/project/overview.md` 了解项目技术栈。仅加载在 `.cantrip/context/tech/` 下**存在**且与该栈匹配的规范文件（例如 overview 写「Go 后端」则加载 `backend.md`；写「Unity 客户端」则加载 `unity.md` 或前端文件）。不要假定一定存在 Unity 或某引擎。
