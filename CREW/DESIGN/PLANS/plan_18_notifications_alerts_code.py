# plan_18_notifications_alerts_code.py
import pandas as pd
from datetime import datetime, timedelta


def check_expiring_certs(training_log, days=30):
    soon = datetime.now() + timedelta(days=days)
    for _, row in training_log.iterrows():
        if "completion_date" in row and pd.to_datetime(row["completion_date"]) < soon:
            print(f"Cert expiring soon: {row['agent_name']}")


def log_alert(message, log_path="assignment_emails.log"):
    with open(log_path, "a") as f:
        f.write(f"ALERT: {message}\n")


# Example usage:
# training_log = pd.read_csv('training_log.csv')
# check_expiring_certs(training_log)
# log_alert('Pilot role unfilled!')
