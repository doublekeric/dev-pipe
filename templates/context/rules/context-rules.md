# Context Mapping Rules

> Maps keywords to context files for automatic loading.

## Format

```
{keyword1}, {keyword2}:
  - path/to/file1.md
  - path/to/file2.md
```

## Implemented Features

**重要**：已实现的功能，用于防止重复开发。

```
inventory, bag, backpack:
  - context/features/inventory.md

battle, combat:
  - context/features/battle.md

shop, store:
  - context/features/shop.md

friend, social:
  - context/features/social.md
```

## Game Systems

System-level documentation (architecture, not implementation status).

### Inventory & Items

inventory, item, bag, backpack:
  - context/systems/inventory.md

### Combat

battle, combat, fight:
  - context/systems/battle.md

### Shop & Economy

shop, store, purchase, buy:
  - context/systems/shop.md

### Progression

level, exp, experience, progression:
  - context/systems/progression.md

### Social

friend, guild, clan, chat:
  - context/systems/social.md

## Technical Topics

### UI

ui, interface, panel, screen:
  - context/tech/ui-guidelines.md

### Performance

performance, optimization, lag, slow:
  - context/tech/performance.md

### Network

network, api, request, server:
  - context/tech/network.md

### Data & Storage

save, load, storage, persistence:
  - context/tech/storage.md

### Resources

resource, asset, load, bundle:
  - context/tech/resources.md

## Common Scenarios

### Configuration

config, excel, table, data:
  - context/tech/config.md

### Testing

test, unit test, integration:
  - context/tech/testing.md

---

## Directory Structure

```
.cantrip/context/
├── features/              # 已实现的功能（用于检查是否存在）
│   ├── inventory.md
│   ├── battle.md
│   └── ...
├── systems/               # 系统文档（架构、设计）
│   ├── inventory.md
│   ├── battle.md
│   └── ...
├── tech/                  # 技术规范
├── experience/            # 经验教训
└── rules/                 # 规则映射
```

## Adding New Rules

When adding a new feature:

1. Register feature in `context/features/{name}.md`
2. Add keyword mapping above
3. Ensure system doc exists in `context/systems/`
