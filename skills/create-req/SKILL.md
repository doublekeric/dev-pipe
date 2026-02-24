---
name: create-req
description: "创建新需求规格。在 requirement-manager 开始分析新功能时激活，生成结构化需求文档。"
---

# Skill: create-req

## 目的

为新功能生成结构化的需求规格说明。

## 触发条件

- 由 requirement-manager 在「analyzing」阶段调用

## 输入

- 任务描述
- 已加载上下文（项目概览、相关系统）
- 检索到的经验

## 流程

### 步骤 1：分析需求

将任务拆解为：
- 核心功能
- 边界情况
- 集成点
- 约束

### 步骤 2：识别涉及系统

列出将受影响、被查询或被通知的系统。

### 步骤 3：生成规格文档

## 输出

`.cantrip/workspace/{task-id}/spec.md`：

```markdown
# Requirement Specification: {Feature Name}

## Overview
{一句话描述}

## Functional Requirements

### F1: {Feature Name}
**Description**: {功能说明}
**Acceptance Criteria**:
- [ ] {Criteria 1}
- [ ] {Criteria 2}

### F2: {Feature Name}
...

## Data Requirements

**New Data**:
- {Data 1}: {Description}

**Modified Data**:
- {Data 2}: {Changes}

## Integration Points

| System | Interaction |
|--------|-------------|
| {System A} | {How it interacts} |

## Constraints

- {Constraint 1}
- {Constraint 2}

## Questions for Clarification

1. {Question 1}
2. {Question 2}

## Related Experience

- {Experience 1}
- {Experience 2}
```

## 输出格式

```
📝 需求规格已创建

**文件**: .cantrip/workspace/{task-id}/spec.md

**摘要**:
- 功能需求：{n} 条
- 涉及系统：{list}
- 待澄清问题：{n} 个

请审阅并确认后继续。
```
