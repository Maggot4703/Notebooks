name: "Create Skill Routing"
description: "Use when selecting a skill for GitHub issue, PR, or notification workflows."
# Instructions & Rules

Instructions and rules define the behavior, constraints, and best practices for agents, skills, and workflows. They are typically stored as `.instructions.md` files in `.github/instructions/`.

## Organization by Context
- **Workspace:** General project rules
- **Agent:** Agent-specific instructions
- **Skill:** Skill-specific rules
- **Notebook/Markdown/PDF:** Format and content rules
- **Startup/Environment:** Troubleshooting and environment setup

## Troubleshooting
- If rules are ignored, check for file naming or path errors.
- Resolve conflicts by prioritizing more specific instructions.
- Update instructions as workflows evolve.

## Example
```markdown
---
name: "Create Skill Routing"
description: "Use when selecting a skill for GitHub issue, PR, or notification workflows."
---

- Use `agent-customization` for customization files
- Use `summarize-github-issue-pr-notification` for summaries
- Use `suggest-fix-issue` for fix suggestions
```

## Updating Instructions
- Edit `.instructions.md` files in `.github/instructions/`.
- Document changes in a changelog section.

## See Also
- [skills-guide.md](skills-guide.md)
- [custom-agents-guide.md](custom-agents-guide.md)
