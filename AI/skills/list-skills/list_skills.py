import os


def find_skills(root_dir):
    skills = []
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if 'SKILL.md' in filenames:
            skill_path = os.path.join(dirpath, 'SKILL.md')
            skill_name = os.path.basename(os.path.dirname(skill_path))
            skills.append((skill_name, skill_path))
    return skills


def main():
    # Adjust the root as needed; this assumes running from the list-skills directory
    workspace_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../..'))
    all_skills = find_skills(workspace_root)
    print("Available Copilot Skills:")
    for name, path in sorted(all_skills):
        print(f"- {name}: {path}")


if __name__ == "__main__":
    main()
