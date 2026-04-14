import csv
from datetime import datetime

# Load agent skills
def load_skills(path):
    with open(path) as f:
        return list(csv.DictReader(f))

# Load training log
def load_training(path):
    with open(path) as f:
        return list(csv.DictReader(f))

# Validate and assign crew
def assign_crew(skills, training):
    assignments = []
    for agent in skills:
        # Example: must have 'Flight Cert' for Pilot
        if 'Flight Cert' in agent['certifications']:
            assignments.append({'role': 'Pilot', 'agent_name': agent['agent_name'], 'assignment_status': 'Confirmed'})
    return assignments

# Write assignments
def write_assignments(assignments, path):
    with open(path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=['role', 'agent_name', 'assignment_status'])
        writer.writeheader()
        writer.writerows(assignments)

# Log action
def log_action(msg, path):
    with open(path, 'a') as f:
        f.write(f'{datetime.now()}: {msg}\n')

if __name__ == '__main__':
    skills = load_skills('../PLANS/skills_db.csv')
    training = load_training('../PLANS/training_log.csv')
    assignments = assign_crew(skills, training)
    write_assignments(assignments, '../PLANS/crew_roster_0426.csv')
    log_action('Crew assignment automation completed.', '../NOTEBOOKS/notebooks.txt')
