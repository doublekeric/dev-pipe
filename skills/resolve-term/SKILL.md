---
name: resolve-term
description: "Resolves different terms to canonical names using both explicit mappings and AI semantic analysis. Learns new mappings automatically."
---

# Skill: resolve-term

## Purpose

Translate different terms to canonical feature names using:
1. **Explicit mappings** - Known aliases in term-mappings.md
2. **Semantic analysis** - AI judges similarity
3. **Auto-learning** - Confirmed matches are saved

## Trigger

- Before index-feature search
- When user describes a feature
- Before registering new feature

## Process

### Step 1: Exact Match

Check `.dev-pipe/context/rules/term-mappings.md`:

```
Input: "道具仓库"
Lookup: exact match in aliases
Result: "inventory" (if found)
```

If found → return canonical name immediately.

### Step 2: Semantic Analysis (if no exact match)

**AI 自动判断语义相似性**：

```
Input: "道具仓库"
Explicit match: Not found

AI Analysis:
- "道具仓库" contains "道具" (item)
- "道具仓库" implies storage
- Existing features with similar meaning:
  - inventory (背包系统) - stores items
  - shop (商店) - sells items
- Most likely: inventory (背包系统)
- Confidence: 85%
```

### Step 3: Confirm with User

If confidence > 70%:

```
🔍 Term Resolution

**Input**: 道具仓库
**Not in mappings**: "道具仓库" is a new term

**AI Guess**: This might be the same as:
→ inventory (背包系统)
   Reason: Both refer to item storage

**Confidence**: 85%

Is "道具仓库" the same as "背包系统"?
[Yes, same feature] [No, different feature]
```

### Step 4: Auto-Learn

If user confirms:

```
✅ Term Learned

"道具仓库" → inventory (背包系统)

Added to .dev-pipe/context/rules/term-mappings.md

Now "道具仓库" will be recognized automatically.
```

## Semantic Analysis Logic

### How AI Judges Similarity

| Indicator | Weight | Example |
|-----------|--------|---------|
| Shared keywords | High | "背包" and "道具" often relate to inventory |
| Functional similarity | High | Both "store items" |
| Context match | Medium | User mentions "add item", "check inventory" |
| Code reference | High | Mentions "InventoryManager" class |

### Examples

| Input | AI Analysis | Result |
|-------|-------------|--------|
| 道具仓库 | storage + items → inventory | inventory (85%) |
| 商城 | buy + items → shop | shop (90%) |
| 打架 | combat → battle | battle (80%) |
| 物品列表 | list + items → inventory UI | inventory (60%) |

### Confidence Thresholds

| Confidence | Action |
|------------|--------|
| > 90% | Suggest strongly, ask for confirmation |
| 70-90% | Suggest, ask for confirmation |
| 50-70% | List possibilities, let user choose |
| < 50% | Treat as new feature |

## Output

### Exact Match Found

```
🔍 Term Resolution

**Input**: {user term}
**Canonical**: {canonical name}

**Known Aliases**:
- {alias 1}
- {alias 2}
```

### Semantic Match

```
🔍 Term Resolution

**Input**: {user term}
**Not explicitly mapped**

**AI Analysis**:
- This appears similar to: {canonical name}
- Reason: {why AI thinks they're similar}
- Confidence: {percentage}

Is this the same feature?
[Yes] [No, it's new]
```

### No Match

```
🔍 Term Resolution

**Input**: {user term}
**Result**: New feature (no similar features found)

Possible related features:
- {feature 1}: {similarity}
- {feature 2}: {similarity}

Proceeding as new feature.
```

## Auto-Learning Details

### When to Save

Save new mapping when:
1. User confirms AI's guess
2. User explicitly says "这是XX功能的别名"

### What to Save

Update `.dev-pipe/context/rules/term-mappings.md`:

```yaml
inventory:
  aliases:
    - 背包
    - 背包系统
    - 道具仓库          # ← Auto-added
```

### Learning Log

Keep track of learned terms:

```markdown
# Term Learning Log

## 2026-02-21
- "道具仓库" → inventory (user confirmed)
- "物品管理" → inventory (user confirmed)

## 2026-02-20
- "商城" → shop (user confirmed)
```

## Integration Flow

```
用户: "实现道具仓库"
         ↓
    resolve-term:
      1. Exact match? No
      2. Semantic analysis: "inventory" (85%)
      3. Ask user: Same as 背包系统?
      4. User: Yes
      5. Save: "道具仓库" → inventory
         ↓
    index-feature: 搜索 "inventory"
         ↓
    找到！背包系统已存在
```

## Benefits

1. **不需要预定义所有别名** - AI 能自动判断
2. **持续学习** - 每次确认都增加知识
3. **减少重复** - 即使用词不同也能识别
4. **团队共享** - 学习结果保存到项目中
