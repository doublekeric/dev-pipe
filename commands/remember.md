---
description: 保存经验教训到知识库，供未来参考。
---

保存经验：$ARGUMENTS

执行流程：

1. **收集信息**
   根据用户提供的信息，引导补充：
   - 问题描述：发生了什么？
   - 触发条件：什么情况下出现？
   - 根本原因：为什么发生？
   - 解决方案：怎么解决的？
   - 如何避免：以后怎么预防？

2. **分类存储**
   根据问题类型保存到对应目录：
   - Bug 相关 → `.dev-pipe/context/experience/bug/`
   - 性能问题 → `.dev-pipe/context/experience/performance/`
   - 功能开发 → `.dev-pipe/context/experience/feature/`

3. **更新规则**
   更新 `.dev-pipe/context/rules/` 中的映射规则，确保：
   - 下次遇到类似问题能自动检索到这条经验
   - 相关关键词能触发风险提示
