# plan_11_automated_role_assignment_code.py


def find_candidates(role, required_skills, required_cert, skills_db):
    candidates = []
    for _, row in skills_db.iterrows():
        if row["availability"] != "Active":
            continue
        if required_cert and required_cert not in row["certifications"]:
            continue
        if all(skill in row["skills"] for skill in required_skills):
            candidates.append(row)
    return sorted(candidates, key=lambda x: x.get("experience", 0), reverse=True)


def auto_assign_roles(roles, skills_db):
    assignments = {}
    for role, req in roles.items():
        candidates = find_candidates(role, req["skills"], req["cert"], skills_db)
        if candidates:
            assignments[role] = candidates[0]["agent_name"]
        else:
            assignments[role] = None  # Flag for review
    return assignments


# Example usage:
# skills_db = pd.read_csv('skills_db.csv')
# roles = {'Pilot': {'skills': ['Piloting'], 'cert': 'Flight Cert'}}
# assignments = auto_assign_roles(roles, skills_db)
# print(assignments)
