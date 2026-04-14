# plan_13_skill_gap_analysis_code.py
import pandas as pd
import re

def parse_roles_from_template(template_path):
    roles = {}
    with open(template_path) as f:
        for line in f:
            m = re.match(r'\| (\w+) \| ([^|]+) \| ([^|]+) \|', line)
            if m:
                role, skills, cert = m.groups()
                roles[role] = {'skills': [s.strip() for s in skills.split(',')], 'cert': cert.strip()}
    return roles

def find_skill_gaps(roles, skills_db):
    gaps = {}
    for role, req in roles.items():
        found = False
        for _, row in skills_db.iterrows():
            if req['cert'] in row['certifications'] and all(skill in row['skills'] for skill in req['skills']):
                found = True
                break
        if not found:
            gaps[role] = req
    return gaps

# Example usage:
# roles = parse_roles_from_template('crew_template_v2.md')
# skills_db = pd.read_csv('skills_db.csv')
# gaps = find_skill_gaps(roles, skills_db)
# print(gaps)
