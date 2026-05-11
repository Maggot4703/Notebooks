# plan_19_role_rotation_randomizer_code.py
import random

def rotate_roles(roles, candidates):
    assignments = {}
    for role in roles:
        if candidates[role]:
            assignments[role] = random.choice(candidates[role])
        else:
            assignments[role] = None
    return assignments

# Example usage:
# roles = ['Pilot', 'Medic']
# candidates = {'Pilot': ['John', 'Alice'], 'Medic': ['Jane', 'Bob']}
# assignments = rotate_roles(roles, candidates)
# print(assignments)
