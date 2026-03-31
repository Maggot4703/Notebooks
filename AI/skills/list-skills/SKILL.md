# list-skills

**Purpose:**
Lists all available Copilot skills in the workspace by searching for SKILL.md files in any /skills/ directory.

**How it works:**
- Recursively scans the workspace for SKILL.md files under any /skills/ subdirectory.
- Outputs a list of skill names and their locations.
- Useful for discovering available skills and their documentation.

**Usage:**
- Run the provided script (list_skills.py) to get an up-to-date list of all skills.
- The script prints the skill name (from the parent folder) and the path to each SKILL.md file.

**Example Output:**
```
Available Copilot Skills:
- api-design: /path/to/api-design/SKILL.md
- data-parsing: /path/to/data-parsing/SKILL.md
...etc
```

**See also:**
- list_skills.py (script to enumerate all skills)
