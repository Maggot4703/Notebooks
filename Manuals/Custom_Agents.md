name: "MyCustomAgent"
description: "Automates project setup and checks."
skills:
# Custom Agents

Custom agents are specialized automation or workflow entities in VS Code or Copilot that execute tasks, enforce rules, or provide domain expertise. They are defined by `.agent.md` files and can be configured with instructions, skills, and hooks.

## Structure
- **Definition File:** `.agent.md` (YAML or Markdown frontmatter)
- **Components:**
  - Name, description, domain
  - Skills (linked by name)
  - Hooks (optional)
  - Prompt files (optional)

## Best Practices
- Keep agents modular and focused on a single domain or workflow.
- Use clear, descriptive names and documentation.
- Test agents in isolated environments before production use.

## Troubleshooting Tips
- Ensure all referenced skills and hooks exist and are correctly named.
- Check for YAML syntax errors in `.agent.md` files.
- Use logging or debug output for complex workflows.

## Example Workflow Diagram
```
[User Action] -> [Custom Agent] -> [Skill 1] -> [Skill 2] -> [Result]
```

## Example
```yaml
---
name: "MyCustomAgent"
description: "Automates project setup and checks."
skills:
  - setup-skill
  - check-skill
hooks:
  onStart: setup-skill
  onError: notify-skill
---
```

## Usage
- Place `.agent.md` in `/AI/agents/` or similar directory.
- Referenced by Copilot or workflow scripts for automation.

## See Also
- [Skills.md](Skills.md)
- [Hooks.md](Hooks.md)
- [Instructions_and_Rules.md](Instructions_and_Rules.md)
