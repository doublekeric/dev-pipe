# Term Mappings

> Maps different terms from different roles to canonical feature names.
> 解决产品、运营、研发表述不一致导致的归档失败问题。

## Purpose

| Role | Their Term | Canonical |
|------|-----------|-----------|
| Product | 背包系统 | inventory |
| Operation | 道具仓库 | inventory |
| Dev | Inventory Module | inventory |

## Format

```yaml
{canonical_name}:
  aliases:
    - {alias1}
    - {alias2}
  category: {system}
  description: {brief}
```

---

## Core Systems

### inventory (背包系统)

```yaml
inventory:
  aliases:
    # Product terms
    - 背包
    - 背包系统
    # Operation terms  
    - 道具仓库
    - 物品管理
    - 库存
    # Dev terms
    - inventory
    - item bag
    - backpack
    - InventoryManager
  category: core
  description: 玩家道具存储系统
```

### shop (商店系统)

```yaml
shop:
  aliases:
    # Product terms
    - 商店
    - 商城
    # Operation terms
    - 商铺
    - 购买界面
    - 充值商城
    # Dev terms
    - shop
    - store
    - mall
    - ShopManager
  category: core
  description: 道具购买系统
```

### battle (战斗系统)

```yaml
battle:
  aliases:
    # Product terms
    - 战斗
    - 战斗系统
    - 打架
    # Operation terms
    - PK
    - 对战
    # Dev terms
    - battle
    - combat
    - fight
    - BattleManager
  category: core
  description: 玩家战斗系统
```

### social (社交系统)

```yaml
social:
  aliases:
    # Product terms
    - 社交
    - 好友
    # Operation terms
    - 好友系统
    - 社区
    # Dev terms
    - social
    - friend
    - SocialManager
  category: core
  description: 玩家社交系统
```

---

## Data Systems

### item (道具系统)

```yaml
item:
  aliases:
    - 道具
    - 物品
    - item
    - ItemConfig
    - 道具配置
  category: data
  description: 道具配置和数据
```

### config (配置系统)

```yaml
config:
  aliases:
    - 配置
    - 表
    - Excel
    - config
    - ConfigTable
    - 配置表
  category: data
  description: 游戏配置系统
```

---

## UI Systems

### ui (UI系统)

```yaml
ui:
  aliases:
    - UI
    - 界面
    - 界面系统
    - ui
    - UI框架
    - UIManager
  category: ui
  description: UI框架和组件
```

---

## Adding New Mappings

When a new feature is implemented:

1. **Decide canonical name** (English, lowercase, short)
2. **Collect all known terms**:
   - Ask product: "你们怎么叫这个功能？"
   - Ask operation: "你们怎么叫？"
   - Check code: Class names, folder names
3. **Add mapping to this file**

### Example

```yaml
achievement:
  aliases:
    # Product
    - 成就
    - 成就系统
    # Operation
    - 里程碑
    - 任务成就
    # Dev
    - achievement
    - AchievementManager
  category: system
  description: 玩家成就系统
```

---

## Integration

### Search Flow

```
用户: "实现道具仓库"
         ↓
    term-resolver: "道具仓库" → canonical: "inventory"
         ↓
    feature-index: 搜索 "inventory"
         ↓
    找到已实现的背包系统
```

### Registration Flow

```
完成实现: "道具仓库"
         ↓
    term-resolver: 检查别名
         ↓
    如果 "inventory" 已存在 → 添加新别名
    如果不存在 → 创建新功能 + 注册别名
```
