# list-agents

**Purpose:**
Lists all available Copilot agents in the workspace, along with the skills associated with each agent (if available).

**How it works:**
- Scans the workspace for agent definitions (e.g., .agent.md, AGENTS.md, or agent configuration files).
- For each agent, lists the agent name and any referenced or required skills.
- Useful for discovering available agents and understanding their capabilities and dependencies.

**Usage:**
- Run the provided script (list_agents.py) to get an up-to-date list of all agents and their skills.
- The script prints the agent name and the skills it uses (if referenced in the agent's configuration or documentation).

**Example Output:**
```
Available Copilot Agents:
- Explore: [data-parsing, rpg-data]
- modernize-java: [api-design]
...etc
```

**See also:**
- list_agents.py (script to enumerate all agents and their skills)
