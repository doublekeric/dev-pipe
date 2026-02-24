---
name: setup-workspace
description: "搭建开发工作区。在开始实现前激活，确保环境就绪。"
---

# Skill: setup-workspace

## 目的

在实现开始前核对并准备开发工作区。

## 触发条件

- 实现开始之前
- 用户明确要求检查环境

## 流程

### 步骤 1：核对项目结构

确认所需目录存在：
- `.cantrip/workspace/`
- 源码目录

### 步骤 2：核对依赖

检查：
- 所需包
- 构建工具
- 测试框架

### 步骤 3：核对配置

检查：
- 构建配置
- 测试配置
- 环境设置

### 步骤 4：创建任务工作区

若不存在则创建 `.cantrip/workspace/{task-id}/`：
- `status.md`
- `notes.md`

## 输出

```markdown
🔧 工作区就绪

**项目结构**: ✅ 有效
**依赖**: ✅ 已安装
**配置**: ✅ 就绪

**任务工作区已创建**:
📁 .cantrip/workspace/{task-id}/
├── status.md
└── notes.md

可以开始实现。
```

## 异常处理

若发现问题：

```markdown
⚠️ 工作区问题

**缺失依赖**:
- {package}: 使用 {command} 安装

**缺失配置**:
- {config}: {如何创建}

是否在继续前解决？
[自动解决] [跳过] [中止]
```
