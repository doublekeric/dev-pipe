# Context Mapping Rules

> Maps keywords to context files for automatic loading.

## Format

```
{keyword1}, {keyword2}:
  - path/to/file1.md
  - path/to/file2.md
```

## Game Systems

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

## Adding New Rules

When adding a new system or experience:

1. Add keyword mapping above
2. Ensure referenced files exist
3. Use specific keywords (avoid generic ones)
