import csv
from datetime import datetime

def load_npcs(path):
    with open(path) as f:
        return list(csv.DictReader(f))

def assign_npcs(npcs):
    assignments = []
    for npc in npcs:
        if npc['role'] and npc['scenario']:
            assignments.append({'npc_name': npc['npc_name'], 'role': npc['role'], 'scenario': npc['scenario'], 'status': 'Assigned'})
    return assignments

def write_assignments(assignments, path):
    with open(path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=['npc_name', 'role', 'scenario', 'status'])
        writer.writeheader()
        writer.writerows(assignments)

def log_action(msg, path):
    with open(path, 'a') as f:
        f.write(f'{datetime.now()}: {msg}\n')

if __name__ == '__main__':
    npcs = load_npcs('../PLANS/npcs/npcs.txt')  # Example: expects a CSV-formatted txt
    assignments = assign_npcs(npcs)
    write_assignments(assignments, '../PLANS/npcs/npc_assignments.csv')
    log_action('NPC assignment automation completed.', '../NOTEBOOKS/notebooks.txt')
