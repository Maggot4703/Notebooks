# plan_14_training_scheduler_code.py


def find_agents_needing_training(roles, skills_db):
    missing_training = []
    for role, req in roles.items():
        for _, row in skills_db.iterrows():
            if req["cert"] not in row["certifications"]:
                missing_training.append((row["agent_name"], role, req["cert"]))
    return missing_training


def schedule_training(agent, cert, training_log_path="training_log.csv"):
    with open(training_log_path, "a") as f:
        f.write(f"{agent},{cert},Scheduled\n")


# Example usage:
# roles = {...}
# skills_db = pd.read_csv('skills_db.csv')
# missing = find_agents_needing_training(roles, skills_db)
# for agent, role, cert in missing:
#     schedule_training(agent, cert)
