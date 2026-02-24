---
name: update-knowledge
description: "在开发过程中检测并提示保存项目知识。处理目录结构、环境配置、技术规范等项目上下文。"
---

# Skill: update-knowledge

## 目的

在开发过程中检测值得保存为项目知识的变更与考量：
- 目录结构
- 环境配置
- 技术检查清单
- 其他项目上下文

## 触发条件

- 开发过程中（设计、实现阶段）
- 检测到变更
- 用户提到模式/规范
- 访问了新目录
- 用户提到环境变更

## 范围

**会更新**：

| 文件 | 内容 | 时机 |
|------|------|------|
| `project/structure.md` | 目录结构 | 新目录、用途变更 |
| `project/environment.md` | 环境配置 | 服务、工具、配置变更 |
| `tech/tech-guidelines.md` | 开发检查清单 | 发现模式、经验教训 |

**不更新**（由其他 skill 处理）：
- `experience/` — 由 experience-depositor 处理
- `features/` — 由 complete-requirement 处理
- `rules/term-mappings.md` — 由 resolve-term 自动学习

## 检测与提示

### 目录结构

```
触发：访问了新目录，且未在 structure.md 中记录

📁 目录结构变更

发现新目录：Assets/Scripts/Achievement/

该目录用途是？
> 成就系统相关代码

是否更新项目结构文档？
[更新] [跳过]
```

### 环境配置

```
触发：用户提到环境变更

🔧 环境变更

你提到测试服地址已变更。

是否更新环境配置文档？
[更新] [跳过]
```

### 技术规范

```
触发：发现重复出现的模式、多次执行相同检查

💡 技术规范建议

注意到本项目经常需要确认：
-「美术资源是否就绪？」

是否加入 UI 开发检查清单？
[添加] [跳过]
```

### 新工具

```
触发：用户使用了新工具

🛠 检测到新工具

你刚使用了 Docker。
项目中尚未记录该工具。

是否加入环境配置？
[添加] [跳过]
```

## 流程

### 步骤 1：判断变更类型

```
判断变更类型：
- 目录变更 → structure.md
- 环境变更 → environment.md
- 模式/检查清单 → tech-guidelines.md
```

### 步骤 2：检查是否已记录

```
若已记录：
  - 不提示
否则：
  - 提示是否保存
```

### 步骤 3：向用户提示

根据变更类型展示对应提示。

### 步骤 4：写入正确文件

根据变更类型更新对应文件。

## 手动命令

```
/pipe update-knowledge        # 交互式更新全部知识
/pipe update-structure        # 仅更新目录结构
/pipe update-environment      # 仅更新环境配置
/pipe update-guidelines       # 仅更新检查清单
```

## 集成点

### 在 implement-design 中

创建新文件或发现模式时，提示保存知识。

### 在 complete-requirement 中

任务完成后，回顾并提示保存新知识。

## 输出

```
📝 项目知识已更新

**已更新文件**：
- project/structure.md：新增 Assets/Scripts/Achievement/
- tech/tech-guidelines.md：新增「美术资源检查」

**摘要**：
- 目录：+1
- 规范：+1
```

## 与其他 Skill 的区分

| Skill | 负责内容 | 说明 |
|-------|----------|------|
| **update-knowledge** | 结构、环境、检查清单 | 开发过程中积累 |
| **experience-depositor** | Bug 类经验 | context: fork |
| **complete-requirement** | 功能记录、术语 | 任务完成时 |
| **resolve-term** | 术语映射 | 自动学习 |
