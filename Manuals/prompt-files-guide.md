# Prompt Files

Prompt files are reusable task launchers for Copilot.
They package goal, scope, constraints, and output shape so repeated tasks stay consistent across sessions.

## What Prompt Files Do
- Standardize how common tasks are requested.
- Reduce ambiguity in analysis, review, and implementation workflows.
- Improve output quality by requiring specific sections and checks.
- Make team workflows discoverable and repeatable.

## Where They Fit
- Prompts define the request structure.
- Agents define behavior mode and tool boundaries.
- Instructions define always-on or scope-based rules.
- Skills define specialized workflows with domain logic.

Related manuals:
- [custom-agents-guide.md](custom-agents-guide.md)
- [instructions-and-rules-guide.md](instructions-and-rules-guide.md)
- [skills-guide.md](skills-guide.md)
- [agents-and-skills-reference.md](agents-and-skills-reference.md)

## Naming Convention
Use a stable sortable pattern:
- NN-domain-action.prompt.md

Guidelines:
- NN is two digits for consistent ordering.
- Use lowercase words separated by hyphens.
- Keep one clear action verb in the name.
- Keep frontmatter name aligned to filename stem.

Example filenames:
- 01-core-skill-router.prompt.md
- 02-notebook-review.prompt.md
- 03-notebook-refactor-minimal.prompt.md
- 04-startup-env-diagnose.prompt.md
- 11-python-notebook-lesson.prompt.md
- 21-bash-command-explorer.prompt.md
- 31-calibre-workflow-helper.prompt.md
- 41-traveller-sector-analysis.prompt.md
- 71-strict-change-review.prompt.md
- 91-prompt-quality-auditor.prompt.md

## Frontmatter Standard

Use this baseline for each prompt:

```yaml
---
name: notebook-review
description: "Use when reviewing notebook quality, execution order, metadata consistency, and reproducibility."
model: GPT-5.3-Codex
---
```

Description rules:
- Start with Use when.
- Include natural trigger phrases users will type.
- State scope and expected outcome clearly.
- Avoid vague wording.

## Prompt Structure Template

Recommended body template:

```markdown
# Prompt Title

Goal:
- One sentence outcome.

Inputs:
- Required input 1
- Required input 2
- Optional input

Constraints:
- Constraint 1
- Constraint 2

Required output:
1. Section 1
2. Section 2
3. Section 3
4. Section 4

Verification:
- What to confirm before completion.
```

## Ordering Scheme
- 01-09: Core and routing prompts.
- 10-39: Notebook lifecycle prompts.
- 40-69: Domain-specific prompts.
- 70-89: Review and QA prompts.
- 90-99: Meta and prompt-audit prompts.

## Prompt Quality Checklist
- Clear scope and boundaries.
- Explicit output contract.
- Defined constraints and non-goals.
- Minimal ambiguity in terms.
- Reproducible verification steps.
- Appropriate depth for expected runtime.

## Common Mistakes
- Prompt asks for everything without scope.
- No required output sections.
- Missing constraints on risky operations.
- Naming that cannot be sorted or discovered.
- Description that lacks trigger phrases.

## Examples

### 1. Core Skill Router

```markdown
---
name: core-skill-router
description: "Use when deciding whether a request should use a prompt, skill, instruction, or agent."
model: GPT-5.3-Codex
---

# Skill Router

Goal:
- Select the best execution primitive.

Inputs:
- User request text
- Optional project area

Required output:
1. Recommended primitive
2. Why it is best
3. Alternative and tradeoff
4. Suggested trigger phrases
```

### 2. Notebook Review

```markdown
---
name: notebook-review
description: "Use when reviewing notebook reliability and reproducibility."
model: GPT-5.3-Codex
---

# Notebook Review

Inputs:
- Notebook path
- Optional focus area

Required output:
1. Short summary
2. Findings by severity
3. Cell-number references
4. Minimal remediation plan
5. Residual risk
```

### 3. Notebook Refactor Minimal

```markdown
---
name: notebook-refactor-minimal
description: "Use when restructuring notebook cells for clarity with no behavior changes."
model: GPT-5.3-Codex
---

# Notebook Refactor Minimal

Constraints:
- No behavior change
- Preserve teaching flow

Required output:
1. Proposed cell map
2. Merge and split suggestions
3. Setup and imports normalization
4. Verification checklist
```

### 4. Startup Environment Diagnose

```markdown
---
name: startup-env-diagnose
description: "Use when startup scripts, activation, or launch behavior fails."
model: GPT-5.3-Codex
---

# Startup Diagnose

Inputs:
- Failing command
- Error message

Required output:
1. Top root causes ranked
2. Evidence per cause
3. Smallest viable fix
4. Verification steps
```

### 5. Python Notebook Lesson

```markdown
---
name: python-notebook-lesson
description: "Use when creating a guided Python lesson in notebook format."
model: GPT-5.3-Codex
---

# Python Lesson Planner

Inputs:
- Topic
- Learner level
- Time box

Required output:
1. Learning objectives
2. Cell sequence
3. Exercises
4. Expected outcomes
5. Common errors and hints
```

### 6. Bash Command Explorer

```markdown
---
name: bash-command-explorer
description: "Use when explaining shell commands with practical and safe examples."
model: GPT-5.3-Codex
---

# Bash Command Explorer

Inputs:
- Command name
- Optional platform assumptions

Required output:
1. Command purpose
2. Key options
3. Progressive examples
4. Failure modes
5. Safety warnings
```

### 7. Calibre Workflow Helper

```markdown
---
name: calibre-workflow-helper
description: "Use when documenting or troubleshooting Calibre CLI workflows."
model: GPT-5.3-Codex
---

# Calibre Workflow Helper

Inputs:
- Objective
- Source and target format

Required output:
1. Command sequence
2. Step rationale
3. Format caveats
4. Validation checks
5. Recovery options
```

### 8. Traveller Sector Analysis

```markdown
---
name: traveller-sector-analysis
description: "Use when validating and querying Traveller sector or world datasets."
model: GPT-5.3-Codex
---

# Traveller Sector Analysis

Inputs:
- Data path
- Query type

Required output:
1. Data assumptions
2. Validation findings
3. Query method
4. Final answer with confidence
5. Follow-up checks
```

### 9. Strict Change Review

```markdown
---
name: strict-change-review
description: "Use when reviewing changes for regressions, risks, and missing tests."
model: GPT-5.3-Codex
---

# Strict Change Review

Required output:
1. Findings first by severity
2. Why each finding matters
3. Suggested remediations
4. Testing gaps
5. Residual risk statement
```

### 10. Prompt Quality Auditor

```markdown
---
name: prompt-quality-auditor
description: "Use when improving prompt clarity, scope, and output reliability."
model: GPT-5.3-Codex
---

# Prompt Quality Auditor

Inputs:
- Prompt text
- Intended audience

Required output:
1. Clarity score
2. Ambiguities
3. Missing constraints
4. Improved output contract
5. Revised draft
```

### 11. Documentation Summarizer

```markdown
---
name: docs-summarizer
description: "Use when converting technical modules into concise user-facing documentation."
model: GPT-5.3-Codex
---

# Docs Summarizer

Required output:
1. What it does
2. Inputs and outputs
3. Example usage
4. Troubleshooting section
```

### 12. Migration Planner

```markdown
---
name: migration-planner
description: "Use when planning phased migrations with compatibility and rollback paths."
model: GPT-5.3-Codex
---

# Migration Planner

Required output:
1. Phased plan
2. Compatibility strategy
3. Rollback strategy
4. Test matrix
5. Communication notes
```
