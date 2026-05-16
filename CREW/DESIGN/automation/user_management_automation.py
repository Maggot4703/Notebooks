import csv
from datetime import datetime


def load_users(path):
    with open(path) as f:
        return list(csv.DictReader(f))


def assign_permissions(users):
    for user in users:
        if user["role"] == "admin":
            user["permissions"] = "all"
        else:
            user["permissions"] = "standard"
    return users


def write_users(users, path):
    with open(path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["user_name", "role", "permissions"])
        writer.writeheader()
        writer.writerows(users)


def log_action(msg, path):
    with open(path, "a") as f:
        f.write(f"{datetime.now()}: {msg}\n")


if __name__ == "__main__":
    users = load_users(
        "../PLANS/users/users.txt"
    )  # Example: expects a CSV-formatted txt
    users = assign_permissions(users)
    write_users(users, "../PLANS/users/user_permissions.csv")
    log_action("User management automation completed.", "../NOTEBOOKS/notebooks.txt")
