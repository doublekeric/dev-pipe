---
description: 保存经验教训到知识库。会启动 experience-depositor agent 在独立上下文中收集和保存经验。
---

使用 experience-depositor agent 保存经验：$ARGUMENTS

这个命令会：

1. **启动独立上下文**
   - experience-depositor 会在隔离的上下文中运行
   - 不会受当前任务对话历史影响

2. **收集信息**
   - 交互式引导补充以下信息：
     - 问题描述：发生了什么？
     - 触发条件：什么情况下出现？
     - 根本原因：为什么发生？
     - 解决方案：怎么解决的？
     - 如何避免：以后怎么预防？
     - 关联系统：涉及哪些系统？

3. **分类存储**
   - Bug 相关 → `.dev-pipe/context/experience/bug/`
   - 性能问题 → `.dev-pipe/context/experience/performance/`
   - 功能开发 → `.dev-pipe/context/experience/feature/`
   - 流程经验 → `.dev-pipe/context/experience/process/`

4. **更新规则**
   - 更新 `.dev-pipe/context/rules/` 中的映射规则
   - 确保下次能自动检索到这条经验

**注意**：如果这是首次使用，需要先运行 `/dev-pipe:pipe init` 初始化项目。
