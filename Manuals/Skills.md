name: "list-skills"
description: "Lists all available Copilot skills in the workspace."
# Skills

Skills are modular, reusable capabilities that agents or Copilot can invoke. Each skill is defined by a `SKILL.md` file and may include scripts, rules, and examples.

## Structure
- **Definition File:** `SKILL.md` (Markdown or YAML frontmatter)
- **Components:**
  - Name, description, domain
  - Usage instructions
  - Example invocations
  - Associated scripts or tools

## Common Skill Types
- Data parsing
- Summarization
- API integration
- File conversion

## Template for New Skills
```markdown
---
name: "<skill-name>"
description: "<what this skill does>"
---

## Usage
Describe how to use the skill here.

## Example Output
- ...
```

## Testing and Validation
- Test skills with sample data and edge cases.
- Validate output against expected results.

## Example
```markdown
---
name: "list-skills"
description: "Lists all available Copilot skills in the workspace."
---

## Usage
Run `python3 list_skills.py` to generate a list of skills.

## Example Output
- list-skills
- list-agents
- lister
```

## See Also
- [Custom_Agents.md](Custom_Agents.md)
- [Instructions_and_Rules.md](Instructions_and_Rules.md)
