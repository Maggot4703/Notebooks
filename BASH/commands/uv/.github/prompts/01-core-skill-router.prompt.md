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

Constraints:
- Prefer the simplest primitive that solves the request.
- Avoid always-on instructions for narrow tasks.
