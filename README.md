# DevPipe

游戏研发 AI 工作流系统，提供需求管理、技术设计、代码实现、Bug 修复、经验沉淀的完整流程。也适用于非游戏项目（后端、工具、SDK 等）；首次初始化会根据项目已有内容提问，空项目则使用普适问题。

**本仓库同时支持 Claude Code 与 Cursor**：同一套 agents、skills、templates 与 `.dev-pipe/` 工作区格式，按你使用的环境选择对应安装方式即可。

| 环境 | 安装方式 | 入口 |
|------|----------|------|
| **Claude Code** | Plugin（Marketplace / 本地 plugin-dir / 手动复制） | 自然语言「用 dev-pipe 实现/修复/记…」 |
| **Cursor** | 一键脚本 | 自然语言「用 dev-pipe 实现/修复/记…」 |

---

## 安装

### Claude Code

#### 方式 1：通过 Marketplace 安装（推荐）

1. **注册 Marketplace**
   
   ```bash
   /plugin marketplace add your-org/dev-pipe
   ```
   
   或使用完整 URL：
   
   ```bash
   /plugin marketplace add https://github.com/doublekeric/dev-pipe.git
   ```

2. **安装 Plugin**
   
   ```bash
   /plugin install dev-pipe@dev-pipe-marketplace
   ```

#### 方式 2：本地加载

```bash
git clone https://github.com/doublekeric/dev-pipe.git
claude --plugin-dir ./dev-pipe
```

#### 方式 3：手动复制

```bash
# 复制到用户目录（全局使用）
cp -r dev-pipe/agents/* ~/.claude/agents/
cp -r dev-pipe/skills/* ~/.claude/skills/
cp -r dev-pipe/templates/* ~/.claude/templates/

# 或复制到项目目录
cp -r dev-pipe/agents/* .claude/agents/
cp -r dev-pipe/skills/* .claude/skills/
cp -r dev-pipe/templates/* .claude/templates/
```

### Cursor

在**要使用 DevPipe 的项目**根目录执行：

```bash
bash -c "$(curl -sL https://raw.githubusercontent.com/doublekeric/dev-pipe/main/scripts/install-cursor.sh)"
```

或先克隆再安装：

```bash
git clone --depth 1 https://github.com/doublekeric/dev-pipe.git .dev-pipe-tmp
./.dev-pipe-tmp/scripts/install-cursor.sh
rm -rf .dev-pipe-tmp
```

脚本会安装：
- skills → `.claude/skills/`（通过 OpenSkills）
- agents → `.cursor/agents/`
- templates → `.claude/templates/`

使用方式：在对话中说「用 dev-pipe 实现 xxx」「希望修改 xxx」等，同一对话内无需重复「用 dev-pipe」。详见 [docs/cursor-migration-analysis.md](docs/cursor-migration-analysis.md)。

## 使用

### 首次使用

```
用 dev-pipe 实现 inventory system
```

首次使用会自动初始化，创建 `.dev-pipe/` 目录。

### 任务类型

| 类型 | 关键词 | 流程 |
|------|--------|------|
| 新功能 | 实现、开发、添加、新建 | 需求分析 → 设计 → 实现 |
| Bug 修复 | 修复、解决、bug、问题 | 问题分析 → 定位 → 修复 |
| 功能修改 | 修改、调整、变更、改动 | 设计 → 实现（跳过需求分析） |
| 优化改进 | 重构、优化、改进 | 设计 → 实现 |
| 经验沉淀 | 沉淀、记录、remember、save experience | 收集信息 → 分类存储 |

### 日常使用

```
用 dev-pipe 实现 xxx      # 新功能
用 dev-pipe 修复 xxx      # Bug 修复
用 dev-pipe 修改 xxx      # 功能修改
用 dev-pipe 记录 xxx 经验 # 保存经验
继续实现 xxx              # 继续任务（同一对话内）
```

### 约定（实现阶段）

- **临时脚本**：代码生成、一次性批处理等**临时脚本**应在**临时目录**中创建和运行（如项目根下 `.tmp/` 或系统临时目录），不要放在 `Tools/`、`Scripts/` 等源码树下，避免与正式工具混淆。正式工具再放入 `Tools/` 并提交。

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

### Skills（18个）

> Skill 命名规则：动词开头

| Skill | 职责 |
|-------|------|
| **dev-pipe** | **入口 Skill，意图识别与路由** |
| init-project | 项目初始化 |
| load-context | 加载项目上下文 |
| update-knowledge | 项目知识积累（结构、环境、检查清单） |
| resolve-term | 术语解析（解决不同角色表述差异） |
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

## 项目结构

```
dev-pipe/
├── .claude-plugin/
│   ├── plugin.json          # Plugin 配置
│   └── marketplace.json     # Marketplace 配置
├── agents/                  # 6 个 Agent
├── skills/                  # 18 个 Skill
└── templates/               # 初始化模板

your-project/
├── .claude/
│   ├── skills/              # DevPipe skills（安装后）
│   └── templates/           # DevPipe templates（安装后）
├── .cursor/
│   └── agents/              # DevPipe agents（安装后，仅 Cursor）
└── .dev-pipe/               # 项目知识库（自动创建）
    ├── context/
    │   ├── project/         # 项目概况
    │   ├── systems/         # 系统文档
    │   ├── tech/            # 技术规范
    │   ├── experience/      # 经验沉淀
    │   └── rules/           # 规则映射
    └── workspace/           # 任务状态
```

## 工作流程

### 新功能开发

```
用 dev-pipe 实现背包系统
         ↓
    dev-pipe skill (phase-router logic)
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
用 dev-pipe 修复背包卡顿
         ↓
    dev-pipe skill → fix-agent
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
用 dev-pipe 修改背包排序规则
         ↓
    dev-pipe skill (phase-router logic)
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
用 dev-pipe 记录道具数量溢出经验
         ↓
    experience-depositor
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
   git remote add origin https://github.com/doublekeric/dev-pipe.git
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
  "repository": "https://github.com/doublekeric/dev-pipe"
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
