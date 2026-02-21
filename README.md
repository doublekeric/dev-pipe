# DevPipe

游戏研发 AI 工作流系统，提供需求管理、技术设计、代码实现、Bug 修复、经验沉淀的完整流程。

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

### 日常使用

```
/dev-pipe:pipe implement xxx      # 新功能开发
/dev-pipe:pipe fix xxx            # Bug 修复
/dev-pipe:pipe continue xxx       # 继续任务
/dev-pipe:remember xxx            # 保存经验
```

## 组件

### Agents（6个）

| Agent | 职责 |
|-------|------|
| phase-router | 意图识别，路由分发 |
| requirement-manager | 需求管理 |
| design-manager | 技术设计管理 |
| implementation-executor | 代码实施 |
| fix-agent | Bug 修复 |
| experience-depositor | 经验沉淀 |

### Skills（13个）

| Skill | 职责 |
|-------|------|
| project-init | 项目初始化 |
| experience-index | 经验检索 |
| req-create | 创建需求规格 |
| req-change | 变更需求规格 |
| design-create | 创建技术方案 |
| design-change | 变更技术方案 |
| workspace-setup | 环境搭建 |
| design-implementation | 按方案实现 |
| code-commit | 代码提交 |
| requirement-completer | 任务完成收尾 |
| requirement-archiver | 任务归档 |
| meta-maintainer | 元数据维护 |
| index-manager | 索引管理 |

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
├── skills/                  # 13 个 Skill
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

### 功能开发

```
需求分析 → 方案设计 → 代码实现 → 验证完成
    ↓          ↓          ↓          ↓
req-create  design-create  implement  commit
```

### Bug 修复

```
问题分析 → 定位根因 → 实施修复 → 验证沉淀
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
