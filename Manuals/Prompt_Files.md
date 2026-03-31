# Prompt Files

Prompt files define the initial context, instructions, or persona for an agent or skill. They are used to guide the behavior of Copilot, custom agents, or chatbots.

## Types
## Prompt Engineering Basics
- **Few-shot:** Provide several examples to guide output.
- **Zero-shot:** Give only instructions, no examples.
- **Persona prompts:** Define the agent's style or role.

## Naming Conventions
- Use descriptive names, e.g., `summarizer.prompt.md`, `qa-bot.prompt.md`.

## Example: Summarization Prompt
```markdown
---
purpose: "Summarize GitHub issues clearly."
role: "Issue Summarizer"
---

Summarize the following issue in 3 bullet points:

- ...
```

## Example: Code Generation Prompt
```markdown
---
purpose: "Generate Python code for data analysis."
role: "Code Generator"
---

Write a Python function that reads a CSV file and returns the average of a column.
```

## Usage
- Place in the agent or skill directory.
- Referenced in `.agent.md` or skill configuration.

## See Also
- [Custom_Agents.md](Custom_Agents.md)
- [Skills.md](Skills.md)

## Example
```markdown
---
purpose: "Summarize GitHub issues clearly."
role: "Issue Summarizer"
---

Summarize the following issue in 3 bullet points:

- ...
```

## Usage
- Place in the agent or skill directory.
- Referenced in `.agent.md` or skill configuration.
