# DevPipe

游戏研发 AI 工作流系统，提供需求管理、技术设计、代码实现、Bug 修复、经验沉淀的完整流程。也适用于非游戏项目（后端、工具、SDK 等）；首次初始化会根据项目已有内容提问，空项目则使用普适问题。

## 安装

### 方式 1：通过 Marketplace 安装（推荐）

1. **注册 Marketplace**
   
   ```bash
   /plugin marketplace add your-org/dev-pipe
   ```
   
   或使用完整 URL：
   
   ```bash
   /plugin marketplace add https://github.com/your-org/dev-pipe.git
   ```

2. **安装 Plugin**
   
   ```bash
   /plugin install dev-pipe@dev-pipe-marketplace
   ```

### 方式 2：本地加载

```bash
git clone https://github.com/your-org/dev-pipe.git
claude --plugin-dir ./dev-pipe
```

### 方式 3：手动复制

```bash
# 复制到用户目录（全局使用）
cp -r dev-pipe/agents/* ~/.claude/agents/
cp -r dev-pipe/skills/* ~/.claude/skills/
cp -r dev-pipe/commands/* ~/.claude/commands/

# 或复制到项目目录
cp -r dev-pipe/agents/* .claude/agents/
cp -r dev-pipe/skills/* .claude/skills/
cp -r dev-pipe/commands/* .claude/commands/
```

## 使用

### 首次使用

```
/dev-pipe:pipe implement inventory system
```

首次使用会自动初始化，创建 `.dev-pipe/` 目录。

### 任务类型

| 类型 | 关键词 | 流程 |
|------|--------|------|
| 新功能 | 实现、开发、添加、新建 | 需求分析 → 设计 → 实现 |
| Bug 修复 | 修复、解决、bug、问题 | 问题分析 → 定位 → 修复 |
| 功能修改 | 修改、调整、变更、改动 | 设计 → 实现（跳过需求分析） |
| 优化改进 | 重构、优化、改进 | 设计 → 实现 |

### 日常使用

```
/dev-pipe:pipe implement xxx      # 新功能
/dev-pipe:pipe fix xxx            # Bug 修复
/dev-pipe:pipe modify xxx         # 功能修改
/dev-pipe:pipe continue xxx       # 继续任务
/dev-pipe:remember xxx            # 保存经验
```

## 组件

### Agents（6个）

> Agent 命名规则：`-er` / `-or` / `-agent` 结尾

| Agent | 职责 |
|-------|------|
| phase-router | 意图识别，路由分发 |
| requirement-manager | 需求管理 |
| design-manager | 技术设计管理 |
| implementation-executor | 代码实施 |
| fix-agent | Bug 修复 |
| experience-depositor | 经验沉淀 |

### Skills（17个）

> Skill 命名规则：动词开头

| Skill | 职责 |
|-------|------|
| init-project | 项目初始化 |
| load-context | 加载项目上下文 |
| **update-knowledge** | **项目知识积累（结构、环境、检查清单）** |
| **resolve-term** | **术语解析（解决不同角色表述差异）** |
| index-feature | 检索已实现功能 |
| index-experience | 经验检索 |
| create-req | 创建需求规格 |
| change-req | 变更需求规格 |
| create-design | 创建技术方案 |
| change-design | 变更技术方案 |
| setup-workspace | 环境搭建 |
| implement-design | 按方案实现 |
| commit-code | 代码提交 |
| complete-requirement | 任务完成收尾（注册功能和术语） |
| archive-requirement | 任务归档 |
| maintain-meta | 元数据维护 |
| manage-index | 索引管理 |

### Commands（2个）

| Command | 用途 |
|---------|------|
| /dev-pipe:pipe | 开发任务入口 |
| /dev-pipe:remember | 保存经验 |

## 项目结构

```
dev-pipe/
├── .claude-plugin/
│   ├── plugin.json          # Plugin 配置
│   └── marketplace.json     # Marketplace 配置
├── agents/                  # 6 个 Agent
├── skills/                  # 17 个 Skill
├── commands/                # 2 个 Command
└── templates/               # 初始化模板

your-project/.dev-pipe/      # 项目知识库（自动创建）
├── context/
│   ├── project/             # 项目概况
│   ├── systems/             # 系统文档
│   ├── tech/                # 技术规范
│   ├── experience/          # 经验沉淀
│   └── rules/               # 规则映射
└── workspace/               # 任务状态
```

## 工作流程

### 新功能开发

```
/pipe 实现背包系统
         ↓
    phase-router
    ├─ resolve-term: "背包系统" → inventory
    ├─ index-feature: 检查 inventory 是否存在
    └─ 不存在 → requirement-manager
         ↓
    requirement-manager
    ├─ load-context: 加载项目上下文
    ├─ index-experience: 检索相关经验
    └─ create-req: 生成需求规格
         ↓
    design-manager
    ├─ create-design: 生成技术方案
    └─ 用户确认
         ↓
    implementation-executor
    ├─ implement-design: 逐步实现
    ├─ commit-code: 提交代码
    └─ complete-requirement: 注册功能 + 术语
         ↓
    ✅ 功能注册到 context/features/inventory.md
    ✅ 术语注册到 rules/term-mappings.md
```

### Bug 修复

```
/pipe 修复背包卡顿
         ↓
    phase-router → fix-agent
         ↓
    fix-agent
    ├─ analyzing: 问题分析
    ├─ locating: 定位根因
    ├─ fixing: 实施修复
    └─ verifying: 验证
         ↓
    commit-code → complete-requirement
         ↓
    ✅ 修复记录可检索
```

### 功能修改

```
/pipe 修改背包排序规则
         ↓
    phase-router
    ├─ resolve-term: "背包" → inventory
    ├─ index-feature: inventory 存在！
    └─ 识别为 Change → design-manager
         ↓
    design-manager (跳过需求分析)
    ├─ 分析现有实现
    ├─ change-design: 生成变更方案
    └─ implementation-executor
```

### 经验沉淀

```
/remember 道具数量溢出
         ↓
    experience-depositor (独立上下文)
    ├─ 交互式收集信息
    ├─ 保存到 context/experience/bug/
    └─ 更新 rules/
         ↓
    ✅ 下次相关问题自动提示
```

## 发布到 GitHub

1. **推送仓库**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/your-org/dev-pipe.git
   git push -u origin main
   ```

2. **团队成员安装**
   ```bash
   /plugin marketplace add your-org/dev-pipe
   /plugin install dev-pipe@dev-pipe-marketplace
   ```

## 自定义

### 修改组织信息

编辑 `.claude-plugin/plugin.json` 和 `.claude-plugin/marketplace.json`：

```json
{
  "name": "dev-pipe",
  "author": {
    "name": "Your Team Name"
  },
  "repository": "https://github.com/your-org/dev-pipe"
}
```

### 添加自定义 Skill

在 `skills/` 目录下创建新文件夹：

```
skills/
└── your-skill/
    └── SKILL.md
```

## License

MIT
