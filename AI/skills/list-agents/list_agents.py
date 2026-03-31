
import os
import re
import yaml

def extract_yaml_frontmatter(text):
    # Extract YAML frontmatter between --- markers
    match = re.search(r'^---\s*([\s\S]+?)---', text, re.MULTILINE)
    if match:
        try:
            return yaml.safe_load(match.group(1))
        except Exception:
            return None
    return None

def find_agents(root_dir):
    agents = {}
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for fname in filenames:
            if fname.lower().endswith('.agent.md') or fname.lower() in ('agents.md', 'agents/agents.md', 'agents.md'):
                agent_path = os.path.join(dirpath, fname)
                with open(agent_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                # Try YAML frontmatter first
                yaml_data = extract_yaml_frontmatter(content)
                if yaml_data and 'name' in yaml_data:
                    name = yaml_data['name']
                    skills = yaml_data.get('skills', [])
                    if isinstance(skills, str):
                        skills = [s.strip() for s in skills.split(',') if s.strip()]
                    agents[name] = skills
                else:
                    # Fallback: parse markdown agent names and skills
                    agent_names = re.findall(r'^#\s+([\w\- ]+)', content, re.MULTILINE)
                    # Look for skills: lines or lists
                    skills = []
                    skill_section = re.search(r'skill[s]?:\s*([\w\-, ]+)', content, re.IGNORECASE)
                    if skill_section:
                        skills = [s.strip() for s in skill_section.group(1).split(',') if s.strip()]
                    # Also look for markdown lists under 'skills' section
                    skills_md = re.findall(r'^[-*]\s*([\w\-]+)\s*$', content, re.MULTILINE)
                    if skills_md:
                        skills = list(set(skills + skills_md))
                    for agent in agent_names:
                        agents[agent] = skills
    return agents

def main():
    workspace_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../..'))
    all_agents = find_agents(workspace_root)
    print("Available Copilot Agents:")
    for agent, skills in sorted(all_agents.items()):
        if skills:
            print(f"- {agent}: [{', '.join(skills)}]")
        else:
            print(f"- {agent}")

if __name__ == "__main__":
    main()
