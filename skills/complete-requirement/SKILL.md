---
name: complete-requirement
description: "完成并收尾需求。在实现完成并验证后激活。更新任务状态、注册功能与术语，并准备归档。"
---

# Skill: complete-requirement

## 目的

收尾已完成的需求，将功能及其术语注册到知识库，并准备归档。

## 触发条件

- 实现已完成
- 代码已提交
- 用户确认任务完成

## 流程

### 步骤 1：确认完成

检查：
- [ ] 实现完成
- [ ] 代码已提交
- [ ] 无严重问题

### 步骤 2：确定规范名

调用 `resolve-term` 检查该功能是否已有规范名；有则沿用并补充新别名，无则新建规范名并登记用户说法为首个别名。

### 步骤 3：注册功能

创建 `.cantrip/context/features/{canonical-name}.md`，包含元数据、描述、能力、文件、接口、历史等。

### 步骤 4：注册术语映射

更新 `.cantrip/context/rules/term-mappings.md`：向已有条目追加新别名，或新建条目。

### 步骤 5：更新状态

更新 `.cantrip/workspace/{task-id}/status.md`，阶段设为 completed，填写摘要与修改文件等。

### 步骤 6：更新工作区索引

更新 `.cantrip/workspace/index.md`：从「进行中」移至「已完成」。

### 步骤 7：提示经验沉淀

询问用户是否有需要保存的教训。

## 输出

```
✅ 需求已完成

**任务**：{task-id}
**状态**：已完成

**功能已注册**：
📄 .cantrip/context/features/{canonical-name}.md

**术语映射**：
📝 "{用户说法}" → "{canonical-name}"
   已知别名：背包, 背包系统, 道具仓库, inventory...

**摘要**：
{实现内容}

**文件**：{n} 个
**提交**：{n} 次

**下一步**：
1. 保存经验？/remember {主题}
2. 归档任务？
```

## 术语注册说明

注册术语后，不同角色用不同说法时都能指向同一功能（如产品说「背包系统」、运营说「道具仓库」、研发说「Inventory」均映射到 inventory，避免重复开发）。注册时可收集：用户原始说法、代码中的类名/目录名，并询问「其他团队怎么叫这个功能？」。
