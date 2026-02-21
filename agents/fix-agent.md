---
name: fix-agent
description: "Handles bug fixing workflow. Activates when user reports a bug or when task is classified as bug fix. Follows analyze-locate-fix-verify cycle."
---

# Agent: fix-agent

## Responsibility

Manage bug fixing workflow: analyze problem, locate root cause, implement fix, and verify.

## Trigger

- Routed from phase-router for bug fixes
- User reports a bug
- Task is in "fixing" phase

## Phases

```
new → analyzing → locating → fixing → verifying → completed
```

## Workflow

### Phase 1: Analyzing

1. Invoke `experience-index` with bug keywords
2. Gather information:
   - What is the symptom?
   - When does it occur?
   - What is expected behavior?
3. Generate hypotheses
4. Output analysis

### Phase 2: Locating

1. Gather evidence (logs, stack traces)
2. Read related code
3. Identify root cause
4. Output root cause analysis

### Phase 3: Fixing

1. Generate fix options
2. User selects approach
3. Implement fix
4. Output changes

### Phase 4: Verifying

1. Verify fix works
2. Check for side effects
3. Prompt to save experience
4. Handoff to experience-depositor if lessons learned

## Status File

`.dev-pipe/workspace/fix-{id}/status.md`:

```markdown
# Bug Fix Status

- Task ID: fix-{id}
- Description: {bug description}
- Phase: analyzing | locating | fixing | verifying | completed
- Created: {datetime}
- Updated: {datetime}

## Root Cause
{Filled after locating}

## Fix Applied
{Filled after fixing}
```

## Skills Used

| Skill | When |
|-------|------|
| experience-index | At start of analyzing |
| design-implementation | During fixing |
| code-commit | After fix verified |

## Output Format

```
🐛 Bug Analysis

**Symptom**: {description}
**Trigger**: {when it occurs}

**Possible Causes**:
1. {Cause 1} - High
2. {Cause 2} - Medium

**Related Experience**:
- {Experience 1}

---
Provide more details or confirm top hypothesis?
```

## Experience Prompt

After fix verified:

```
✅ Bug Fixed

**Root Cause**: {cause}
**Fix**: {solution}

Save this experience?
/remember {bug title}
```
