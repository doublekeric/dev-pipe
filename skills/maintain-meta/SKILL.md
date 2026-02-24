---
name: maintain-meta
description: "维护 Cantrip 元数据文件与结构。在元数据需要更新或校验时激活，保证工作区与上下文文件一致。"
---

# Skill: maintain-meta

## 目的

维护并校验 Cantrip 元数据与**目录结构**，保证知识库内一致。  
索引的**增删改**由 **manage-index** 规范；本 skill 负责**校验**（该有的文件是否都在、索引与实际目录是否一致）和**清理**。

## 触发条件

- 定期维护
- 重大变更后
- 用户要求校验
- 检测到不一致

## 职责

### 1. 结构校验

检查 `.cantrip/` 下**该有的文件和目录是否都存在**，避免缺了关键文件导致后续流程报错。例如：

- `context/project/overview.md`
- `context/rules/` 下的 context-rules.md、risk-rules.md、pattern-rules.md、term-mappings.md 等
- `workspace/index.md`

若缺失则提示补建或重新初始化，不负责索引条目的日常增删改（那是 manage-index 的范畴）。

### 2. 校验索引

检查 `.cantrip/workspace/index.md` 与实际情况是否一致：

- 所列任务均有对应目录
- 无孤立任务目录（有目录但未在 index 中）
- 状态与实际一致

索引内容的**增删改**规范见 **manage-index**；本处只做一致性校验，必要时可建议调用 manage-index 做 sync。

### 3. 校验规则

检查规则文件引用的文档是否存在：

- context-rules.md 引用路径有效
- risk-rules.md、pattern-rules.md 引用有效

### 4. 清理

- 移除过期引用
- 归档旧任务
- 更新过时信息

## 输出

```
🔧 元数据维护报告

**结构**: ✅ 有效
**索引**: ✅ 一致
**规则**: ⚠️ 1 处过期引用

**发现的问题**:
- context-rules.md 中过期引用："old-system.md" 不存在
  建议：移除该引用

**已执行操作**:
- 无

**建议**:
- 归档已完成任务：feat-old-feature-20260101
```

## 子动作（非独立 command）

| 子动作 | 说明 |
|--------|------|
| `validate` | 校验全部元数据（结构 + 索引 + 规则） |
| `cleanup` | 移除过期引用、更新过时信息 |
| `sync` | 使索引与实际目录同步（与 manage-index 约定一致） |
