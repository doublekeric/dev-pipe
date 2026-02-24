---
name: change-req
description: "修改已有需求规格。在用户要求变更需求或分析过程中出现新信息时激活。"
---

# Skill: change-req

## 目的

根据用户反馈或新信息修改已有需求规格。

## 触发条件

- 用户要求修改需求
- 发现新约束
- 需要调整范围

## 输入

- 现有 spec.md 路径
- 变更说明
- 变更原因

## 流程

### 步骤 1：读取现有规格

加载 `.cantrip/workspace/{task-id}/spec.md`

### 步骤 2：应用变更

- 新增需求
- 修改已有需求
- 删除过时需求
- 更新涉及系统列表

### 步骤 3：记录变更

在 spec 中记录变更历史。

## 输出

更新后的 `.cantrip/workspace/{task-id}/spec.md`：

```markdown
# Requirement Specification: {Feature Name}

> **Last Updated**: {datetime}
> **Change**: {description}

## Change History

| Date | Change | Reason |
|------|--------|--------|
| {date} | {description} | {reason} |

## Overview
...

## Functional Requirements
...
```

## 输出格式

```
📝 需求规格已更新

**变更**:
- 新增: {requirement}
- 修改: {requirement}
- 删除: {requirement}

**影响**:
- 涉及系统: {list}
- 对设计的影响: {description}

请审阅变更。
```
