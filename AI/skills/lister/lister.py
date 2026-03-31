import os
import re
import yaml

def extract_yaml_frontmatter(text):
    match = re.search(r'^---\s*([\s\S]+?)---', text, re.MULTILINE)
    if match:
        try:
            return yaml.safe_load(match.group(1))
        except Exception:
            return None
    return None

def find_skills(root_dir):
    skills = []
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if 'SKILL.md' in filenames:
            skill_path = os.path.join(dirpath, 'SKILL.md')
            skill_name = os.path.basename(os.path.dirname(skill_path))
            skills.append((skill_name, skill_path))
    return skills

def find_agents(root_dir):
    agents = {}
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for fname in filenames:
            if fname.lower().endswith('.agent.md') or fname.lower() in ('agents.md', 'agents/agents.md', 'agents.md'):
                agent_path = os.path.join(dirpath, fname)
                with open(agent_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                yaml_data = extract_yaml_frontmatter(content)
                if yaml_data and 'name' in yaml_data:
                    name = yaml_data['name']
                    skills = yaml_data.get('skills', [])
                    if isinstance(skills, str):
                        skills = [s.strip() for s in skills.split(',') if s.strip()]
                    agents[name] = skills
                else:
                    agent_names = re.findall(r'^#\s+([\w\- ]+)', content, re.MULTILINE)
                    skills = []
                    skill_section = re.search(r'skill[s]?:\s*([\w\-, ]+)', content, re.IGNORECASE)
                    if skill_section:
                        skills = [s.strip() for s in skill_section.group(1).split(',') if s.strip()]
                    skills_md = re.findall(r'^[-*]\s*([\w\-]+)\s*$', content, re.MULTILINE)
                    if skills_md:
                        skills = list(set(skills + skills_md))
                    for agent in agent_names:
                        agents[agent] = skills
    return agents

def main():
    workspace_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../..'))
    all_skills = find_skills(workspace_root)
    all_agents = find_agents(workspace_root)
    output_path = os.path.join(os.path.dirname(__file__), 'lister-output.txt')
    with open(output_path, 'w', encoding='utf-8') as out:
        out.write("Available Copilot Agents:\n")
        for agent, skills in sorted(all_agents.items()):
            if skills:
                out.write(f"- {agent}: [{', '.join(skills)}]\n")
            else:
                out.write(f"- {agent}\n")
        out.write("\nAvailable Copilot Skills:\n")
        for name, path in sorted(all_skills):
            out.write(f"- {name}: {path}\n")
    print(f"Output written to {output_path}")

if __name__ == "__main__":
    main()
