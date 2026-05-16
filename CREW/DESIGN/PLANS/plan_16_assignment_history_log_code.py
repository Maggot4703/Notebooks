# plan_16_assignment_history_log_code.py
import csv
from datetime import datetime


def log_assignment_change(
    role, agent, action, user, history_path="assignment_history.csv"
):
    with open(history_path, "a", newline="") as f:
        writer = csv.writer(f)
        writer.writerow([datetime.now().isoformat(), role, agent, action, user])


# Example usage:
# log_assignment_change('Pilot', 'John Doe', 'assigned', 'admin')
