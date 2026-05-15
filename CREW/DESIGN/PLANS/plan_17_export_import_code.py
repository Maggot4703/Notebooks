# plan_17_export_import_code.py
import pandas as pd


def export_to_csv(df, filename):
    df.to_csv(filename, index=False)


def import_from_csv(filename):
    return pd.read_csv(filename)


# Example usage:
# df = pd.read_csv('skills_db.csv')
# export_to_csv(df, 'exported_skills.csv')
# new_df = import_from_csv('exported_skills.csv')
