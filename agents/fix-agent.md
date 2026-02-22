---
name: fix-agent
description: "Handles bug fixing workflow. Activates when user reports a bug or when task is classified as bug fix. Follows analyze-locate-fix-verify cycle."
---

# Agent: fix-agent

## Responsibility

Manage bug fixing workflow: analyze problem, locate root cause, implement fix, verify, and register experience.

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

1. Invoke `resolve-term` (check if bug relates to known feature)
2. Invoke `index-experience` with bug keywords
3. Gather information:
   - What is the symptom?
   - When does it occur?
   - What is expected behavior?
4. Generate hypotheses
5. Output analysis

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
3. Invoke `commit-code` skill
4. Invoke `complete-requirement` (register as experience)
5. Optionally invoke `experience-depositor` for detailed lesson

## Status File

`.dev-pipe/workspace/fix-{id}/status.md`:

```markdown
# Bug Fix Status

- Task ID: fix-{id}
- Description: {bug description}
- Related Feature: {canonical name if known}
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
| resolve-term | At start (relate to known feature) |
| index-experience | At start of analyzing |
| implement-design | During fixing |
| commit-code | After fix verified |
| complete-requirement | After commit (register experience) |

## Output Format

### Analysis

```
🐛 Bug Analysis

**Symptom**: {description}
**Trigger**: {when it occurs}
**Related Feature**: {feature name if found}

**Possible Causes**:
1. {Cause 1} - High
2. {Cause 2} - Medium

**Related Experience**:
- {Experience 1}

---
Provide more details or confirm top hypothesis?
```

### Completion

```
✅ Bug Fixed

**Root Cause**: {cause}
**Fix**: {solution}
**Commit**: {hash}

**Experience Registered**: This fix is now searchable.

Save detailed lesson learned?
/remember {bug title}
```

## Handoff

After fix verified and committed:

1. complete-requirement → Register fix as experience
2. (Optional) experience-depositor → Save detailed lesson
