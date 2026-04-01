---
name: strict-change-review
description: "Use when reviewing changes for regressions, hidden risks, and missing tests."
model: GPT-5.3-Codex
---

# Strict Change Review

Goal:
- Perform a risk-first review that prioritizes correctness over style.

Inputs:
- Scope of changes
- Optional risk focus: security, data loss, runtime failures

Required output:
1. Findings first, ordered by severity
2. Precise location references
3. Why each issue matters
4. Suggested remediation
5. Testing gaps and residual risk

Constraints:
- Prioritize correctness over style nits.
- Avoid vague suggestions.
- Explicitly state when no findings exist.
