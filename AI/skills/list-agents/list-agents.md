# list-agents

This skill lists all available Copilot agents in the workspace, along with the skills associated with each agent (if available).

## Usage

- See [SKILL.md](SKILL.md) for documentation and purpose.
- Run the script [list_agents.py](list_agents.py) to enumerate all agents and their skills:
  ```bash
  python3 list_agents.py
  ```
  This will print a list of all agents and the skills they reference (if any).

## Example Output
```
Available Copilot Agents:
- Explore: [data-parsing, rpg-data]
- modernize-java: [api-design]
...etc
```
