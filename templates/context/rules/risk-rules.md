# Risk Warning Rules

> Defines risk warnings based on keywords.

## Format

```
{keyword1}, {keyword2}:
  - level: high | medium | low
  - message: {warning message}
  - ref: {path to reference doc}
```

## Data Safety (High)

### Quantity Operations

item, add, quantity, increment:
  - level: high
  - message: Check for overflow before adding quantities
  - ref: context/experience/bug/quantity-overflow.md

### Financial Operations

payment, purchase, currency, money:
  - level: high
  - message: Add idempotency check and full logging for financial operations
  - ref: context/experience/bug/payment-duplicate.md

### Data Persistence

save, persist, write, store:
  - level: high
  - message: Handle exceptions, ensure data consistency
  - ref: context/experience/bug/data-corruption.md

## Performance (Medium)

### Loops & Iteration

loop, iterate, foreach, for:
  - level: medium
  - message: Cache list length, avoid per-frame iteration on large lists

### Object Creation

instantiate, create, new, spawn:
  - level: medium
  - message: Use object pooling for frequently created objects

### UI Updates

update, refresh, redraw, ui:
  - level: medium
  - message: Avoid creating objects in Update(), use event-driven updates

### Resource Loading

load, asset, resource:
  - level: medium
  - message: Use async loading, consider unloading strategy

## Memory (Medium)

### Large Assets

texture, sprite, image, atlas:
  - level: medium
  - message: Compress large textures, monitor memory usage

### Collections

list, dictionary, array, collection:
  - level: medium
  - message: Consider capacity, clear when done

## Logic (Medium)

### Async Operations

async, await, coroutine:
  - level: medium
  - message: Handle race conditions, ensure atomicity

### Event Handling

subscribe, listen, event, callback:
  - level: medium
  - message: Always unsubscribe to prevent memory leaks

### Null Handling

get, find, access, retrieve:
  - level: medium
  - message: Add null checks, use null object pattern if appropriate

## Configuration (Low)

### Config Changes

config, excel, table:
  - level: low
  - message: Verify format, check for circular dependencies

---

## Adding New Warnings

1. Identify the risk level (high/medium/low)
2. Write specific, actionable message
3. Reference existing experience doc or create one
