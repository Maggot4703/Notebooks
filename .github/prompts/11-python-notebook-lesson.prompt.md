---
name: python-notebook-lesson
description: "Use when generating a guided Python learning notebook sequence with exercises."
model: GPT-5.3-Codex
---

# Python Notebook Lesson

Goal:
- Build a notebook-ready lesson plan with progressive exercises.

Inputs:
- Topic
- Learner level: beginner, intermediate, advanced
- Time box in minutes

Required output:
1. Learning objectives
2. Cell plan with sequence
3. Short explanations per section
4. Hands-on exercises with expected outcomes
5. Common mistakes and hints

Constraints:
- Keep explanations concise.
- Prefer runnable examples.
- Include incremental difficulty.
