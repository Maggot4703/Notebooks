
# list-skills

This skill lists all available Copilot skills in the workspace by searching for SKILL.md files in any /skills/ directory.

## Usage

- See [SKILL.md](SKILL.md) for documentation and purpose.
- Run the script [list_skills.py](list_skills.py) to enumerate all skills:
	```bash
	python3 list_skills.py
	```
	This will print a list of all skills and their SKILL.md file locations.

## Example Output
```
Available Copilot Skills:
- api-design: /path/to/api-design/SKILL.md
- data-parsing: /path/to/data-parsing/SKILL.md
...etc
```
