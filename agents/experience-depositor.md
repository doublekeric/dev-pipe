---
name: experience-depositor
description: "Deposits lessons learned. Activates when user runs /remember or when task completes with lessons to save. Runs in isolated context."
---

# Agent: experience-depositor

## Responsibility

Structure and save lessons learned to the knowledge base. Update retrieval rules.

## Key Feature

**Runs in isolated context** - Does not share context with current task, preventing contamination.

## Trigger

- User executes `/remember {description}`
- Task completes with notable lessons
- User explicitly requests to save experience

## Workflow

### Step 1: Collect Information

Interactive collection:

```
📝 Experience Deposit

**Brief**: {extracted from input}

1. What happened?
   > 

2. What triggered it?
   > 

3. What was the root cause?
   > 

4. How was it resolved?
   > 

5. How to prevent in future?
   > 

6. Related systems? (comma separated)
   > 
```

### Step 2: Categorize

Determine category:

| Category | Location |
|----------|----------|
| Bug | `.dev-pipe/context/experience/bug/` |
| Performance | `.dev-pipe/context/experience/performance/` |
| Feature | `.dev-pipe/context/experience/feature/` |
| Process | `.dev-pipe/context/experience/process/` |

### Step 3: Save

Invoke `save-experience` concept (embedded):

Create `.dev-pipe/context/experience/{category}/{title}.md`:

```markdown
# {Title}

## Metadata
- Category: {category}
- Date: {date}
- Systems: {list}
- Keywords: {list}

## Problem
{What happened}

## Trigger
{When it occurs}

## Root Cause
{Why it happened}

## Solution
{How resolved}

## Prevention
{How to avoid}
```

### Step 4: Update Rules

Update `.dev-pipe/context/rules/`:

1. **context-rules.md** - Add keyword mapping
2. **risk-rules.md** - Add risk warning if applicable
3. **pattern-rules.md** - Add pattern if applicable

## Output Format

```
✅ Experience Deposited

**File**: .dev-pipe/context/experience/{category}/{title}.md
**Keywords**: {list}

**Rules Updated**:
- context-rules.md: Added "{keyword}" mapping
- risk-rules.md: Added warning for "{keyword}"

This experience will be auto-loaded for similar future tasks.
```

## Integration with experience-index

After depositing, the `experience-index` skill will automatically find this experience when:
- Keywords match
- Related systems are involved
- Similar context is detected
