# Cantrip

游戏研发 AI 工作流系统，提供需求管理、技术设计、代码实现、Bug 修复、经验沉淀的完整流程。也适用于非游戏项目（后端、工具、SDK 等）；首次初始化会根据项目已有内容提问，空项目则使用普适问题。

**Cursor 专用**：在 Cursor 中通过 agents、skills、templates 与 `.cantrip/` 工作区运行；入口为自然语言「用 cantrip 实现/修复/记…」。

---

## 安装

在**要使用 Cantrip 的项目**根目录执行：

```bash
bash -c "$(curl -sL https://raw.githubusercontent.com/doublekeric/dev-cantrip/main/scripts/install-cursor.sh)"
```

或先克隆再安装：

```bash
git clone --depth 1 https://github.com/doublekeric/dev-cantrip.git .cantrip-tmp
./.cantrip-tmp/scripts/install-cursor.sh
rm -rf .cantrip-tmp
```

脚本会安装到 `.cursor/` 下：
- agents → `.cursor/agents/`
- skills → `.cursor/skills/`
- templates → `.cursor/templates/`

使用方式：在对话中说「用 cantrip 实现 xxx」「希望修改 xxx」等，同一对话内无需重复「用 cantrip」。

## 使用

### 首次使用

```
用 cantrip 实现 inventory system
```

首次使用会自动初始化，创建 `.cantrip/` 目录。

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
用 cantrip 实现 xxx      # 新功能
用 cantrip 修复 xxx      # Bug 修复
用 cantrip 修改 xxx      # 功能修改
用 cantrip 记录 xxx 经验 # 保存经验
继续实现 xxx              # 继续任务（同一对话内）
```

### 约定（实现阶段）

- **临时脚本**：代码生成、一次性批处理等**临时脚本**应在**临时目录**中创建和运行（如项目根下 `.tmp/` 或系统临时目录），不要放在 `Tools/`、`Scripts/` 等源码树下，避免与正式工具混淆。正式工具再放入 `Tools/` 并提交。

## 组件

### Agents（5个）

> Agent 命名规则：`-er` / `-or` / `-agent` 结尾  
> 入口路由由 **phase-router skill** 完成（当前对话 agent 执行该 skill，按任务类型交给下表中的一个 agent）。

| Agent | 职责 |
|-------|------|
| requirement-manager | 需求管理 |
| design-manager | 技术设计管理 |
| implementation-executor | 代码实施 |
| fix-agent | Bug 修复 |
| experience-depositor | 经验沉淀 |

### Skills（18个）

> Skill 命名规则：动词开头

| Skill | 职责 |
|-------|------|
| **phase-router** | **入口 Skill，意图识别与路由（触发：用 cantrip 或 用 phase-router）** |
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
| maintain-meta | 元数据与结构校验、规则校验、清理（索引的增删改见 manage-index） |
| manage-index | 仅索引：任务/经验索引的增删改 |

## 项目结构

```
dev-cantrip/
├── agents/                  # 5 个 Agent
├── skills/                  # 18 个 Skill
├── templates/               # 初始化模板
└── scripts/
    └── install-cursor.sh    # Cursor 安装脚本

your-project/
├── .cursor/
│   ├── agents/             # Cantrip agents（安装后）
│   ├── skills/            # Cantrip skills（安装后）
│   └── templates/         # Cantrip templates（安装后）
└── .cantrip/              # 项目知识库（自动创建）
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
用 cantrip 实现背包系统
         ↓
    phase-router skill
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
用 cantrip 修复背包卡顿
         ↓
    phase-router skill → fix-agent
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
用 cantrip 修改背包排序规则
         ↓
    phase-router skill
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
用 cantrip 记录道具数量溢出经验
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
   git remote add origin https://github.com/doublekeric/dev-cantrip.git
   git push -u origin main
   ```

2. **团队成员安装**：在项目根目录执行上述安装命令即可。

## 自定义

### 添加自定义 Skill

在 `skills/` 目录下创建新文件夹：

```
skills/
└── your-skill/
    └── SKILL.md
```

## 设计说明与迁移

### Command（已移除）

Cantrip 早期在 Claude 里使用时有过 **Command** 层，迁移到 Cursor 时因当时认为 Cursor 没有 command 机制而删除。原先只有两条：

- **req-dev**：开发需求（对应现在的「用 cantrip 实现/修改…」流程）
- **remember**：沉淀知识（对应「用 cantrip 记录…」→ experience-depositor）

当前在 Cursor 中统一用自然语言入口「用 cantrip …」，不再单独抽象 command 层。

### 路由：phase-router skill

应由 **phase-router** 做「判断任务类型、交给哪个子 agent」；在 Cursor 里，**当前对话中响应你的 agent** 通过执行 **phase-router skill**（解析术语、检查功能、检查进行中任务、按类型路由）完成该职责。入口语保持「用 cantrip」或「用 phase-router」均可。

### maintain-meta 与 manage-index 分工

- **manage-index**：**只处理索引相关**。负责任务索引（`workspace/index.md`）、经验索引（若有）的增删改——例如新任务加入进行中、任务完成/归档后更新索引条目。其他 skill（如 complete-requirement、archive-requirement）在完成任务/归档时会按此规范更新索引。
- **maintain-meta**：元数据与**结构校验**、规则校验、清理。其中「结构校验」指：检查 `.cantrip/` 下**该有的文件和目录是否都存在**（如 `context/project/overview.md`、`context/rules/` 下各规则文件、`workspace/index.md` 等），避免缺了关键文件导致后续流程报错。索引的「校验、与实际目录同步」也由 maintain-meta 负责，必要时可视为调用或遵循 manage-index 的约定做一致性检查。

## License

MIT
