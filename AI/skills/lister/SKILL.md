# lister

**Purpose:**  
Lists all available Copilot agents and skills in the workspace, showing which skills are associated with each agent.

**How it works:**  
- Recursively scans the workspace for agent definitions (.agent.md, AGENTS.md, agents.md, etc.) and skill definitions (SKILL.md).
- Extracts agent names and their referenced skills (from YAML frontmatter or markdown).
- Outputs a text file (lister-output.txt) with a summary of all agents and their skills, and a list of all skills.

**Usage:**  
Run the script lister.py to generate lister-output.txt in the current directory.

**Example Output:**
```
Available Copilot Agents:
- AgentName1: [skill1, skill2]
- AgentName2: [skill3]
...

Available Copilot Skills:
- skill1: /path/to/skill1/SKILL.md
- skill2: /path/to/skill2/SKILL.md
...
```
