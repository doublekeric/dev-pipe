---
name: create-design
description: "Creates technical design document. Activates when design-manager starts designing after requirements are confirmed. Generates architecture, data structures, and implementation plan. Auto-loads tech stack guidelines."
---

# Skill: create-design

## Purpose

Generate a technical design document based on approved requirements, incorporating tech stack specific guidelines.

## Trigger

- Invoked by design-manager during "designing" phase
- Requirements are confirmed and available

## Input

- Path to spec.md
- Loaded tech guidelines
- Retrieved experiences

## Process

### Step 1: Read Requirements

Load `.dev-pipe/workspace/{task-id}/spec.md`

### Step 2: Load Tech Guidelines

根据项目类型和功能特性，自动加载相关技术规范：

```
.dev-pipe/context/tech/
├── tech-guidelines.md    # 通用技术栈指南
├── code-style.md         # 代码风格
├── frontend.md           # 前端规范（如果项目是前端）
├── backend.md            # 后端规范（如果项目是后端）
└── unity.md              # Unity 规范（如果是 Unity 项目）
```

**自动检测**：
- 如果 spec.md 包含 "UI"、"界面"、"面板" → 加载 frontend.md
- 如果 spec.md 包含 "数据库"、"API"、"接口" → 加载 backend.md
- 根据 project/overview.md 中的技术栈配置

### Step 3: Design Architecture

- Module structure
- Layer separation
- Dependencies

### Step 4: Design Data Structures

- New data types
- Modified data types
- Storage considerations

### Step 5: Design Interfaces

- Public APIs
- Event contracts
- Integration points

### Step 6: Create Implementation Plan

- Break into tasks
- Order by dependencies
- Estimate effort

### Step 7: Apply Tech Checklist

根据功能类型应用检查清单：

**如果是 UI 功能**：
- [ ] UI 层级关系是否清晰？
- [ ] 是否需要美术资源？
- [ ] 是否有动效需求？
- [ ] 是否有音效？

**如果是数据功能**：
- [ ] 数据库表结构是否需要修改？
- [ ] 是否需要缓存？
- [ ] 是否需要事务？

### Step 8: Identify Risks

Based on:
- Retrieved experiences
- Technical complexity
- Integration challenges
- Tech stack specific risks

## Output

`.dev-pipe/workspace/{task-id}/design.md`:

```markdown
# Technical Design: {Feature Name}

## Overview
{Brief description}

## Tech Guidelines Applied

**Loaded**: {tech guideline files}

**Checklist**:
- [ ] {Tech checklist item 1}
- [ ] {Tech checklist item 2}

## Architecture

### Module Structure
```
{Module}/
├── {File1}.cs    # {Purpose}
├── {File2}.cs    # {Purpose}
└── {File3}.cs    # {Purpose}
```

### Dependencies
- {Module A} → {Module B}: {Why}

## Data Structures

### {Structure Name}
```csharp
public class {Name} {
    public {Type} {Field};  // {Purpose}
}
```

## Interfaces

### I{InterfaceName}
```csharp
public interface I{Name} {
    {Return} {Method}({Params});  // {Purpose}
}
```

## Tech Stack Considerations

### Frontend (if applicable)
- UI Resources needed: {list}
- Animation needs: {description}
- Performance concerns: {description}

### Backend (if applicable)
- Database changes: {description}
- API endpoints: {list}
- Caching strategy: {description}

## Implementation Plan

### Phase 1: {Name}
- [ ] {Task 1} - {Estimate}
- [ ] {Task 2} - {Estimate}

### Phase 2: {Name}
...

## Risk Assessment

| Risk | Level | Mitigation |
|------|-------|------------|
| {Risk} | high/medium/low | {Mitigation} |

## Testing Strategy

- Unit tests: {What to test}
- Integration tests: {What to test}

## References

- {Experience 1}
- {Tech Guideline 1}
```

## Output Format

```
📐 Technical Design Created

**File**: .dev-pipe/workspace/{task-id}/design.md

**Tech Guidelines Loaded**:
- frontend.md (UI checklist)
- unity.md (Performance checklist)

**Summary**:
- Modules: {n}
- Tasks: {n}
- High risks: {n}
- Tech checklist items: {n}

**Questions**:
- {Question from tech guidelines}
- {Question from tech guidelines}

Review design and confirm to proceed to implementation.
```

## Tech Guidelines Loading Logic

### Detection Rules

| If Spec Contains | Load Guidelines |
|------------------|-----------------|
| UI, 界面, 面板, Panel | frontend.md |
| 数据库, Database, API | backend.md |
| 动画, Animation, 特效 | frontend.md |
| 网络, Network, 请求 | backend.md |
| 性能, Performance | tech-guidelines.md |

### Project Type Based

Read from `.dev-pipe/context/project/overview.md`:

```markdown
## Tech Stack
- Frontend: Unity 2021.3
- Backend: Go
```

Auto-load:
- unity.md for frontend tasks
- backend.md for backend tasks
