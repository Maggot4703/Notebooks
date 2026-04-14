# plan_12_agent_availability_tracking_code.py
import pandas as pd

def is_available(agent_row):
    return agent_row['availability'] == 'Active'


# Example filter for available agents:
import os
module_dir = os.path.dirname(os.path.abspath(__file__))
skills_db_path = os.path.join(module_dir, 'skills_db.csv')
skills_db = pd.read_csv(skills_db_path)
available_agents = skills_db[skills_db['availability'] == 'Active']
print(available_agents[['agent_name', 'availability']])

# Example CLI update (pseudo):
# python Crew.py set-availability --agent "John Doe" --status "On Leave"
# (Parse args, then:)
# skills_db.loc[skills_db['agent_name'] == agent, 'availability'] = status
# skills_db.to_csv('skills_db.csv', index=False)
