from flask import Flask, render_template_string
import csv
import os

app = Flask(__name__)

# Simple HTML template for dashboard
TEMPLATE = '''
<!DOCTYPE html>
<html>
<head>
    <title>Crew Management Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; }
        table { border-collapse: collapse; width: 80%; margin-bottom: 2em; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background: #f0f0f0; }
        h2 { margin-top: 2em; }
    </style>
</head>
<body>
    <h1>Crew Management Dashboard</h1>
    <h2>Crew Assignments</h2>
    <table>
        <tr>{% for col in crew_header %}<th>{{ col }}</th>{% endfor %}</tr>
        {% for row in crew %}<tr>{% for col in crew_header %}<td>{{ row[col] }}</td>{% endfor %}</tr>{% endfor %}
    </table>
    <h2>Recent Actions</h2>
    <pre>{{ logs }}</pre>
</body>
</html>
'''

@app.route('/')
def dashboard():
    # Load crew assignments
    crew = []
    crew_header = []
    crew_path = os.path.join(os.path.dirname(__file__), '../PLANS/crew_roster_0426.csv')
    if os.path.exists(crew_path):
        with open(crew_path) as f:
            reader = csv.DictReader(f)
            crew = list(reader)
            crew_header = reader.fieldnames
    # Load logs
    logs_path = os.path.join(os.path.dirname(__file__), '../NOTEBOOKS/notebooks.txt')
    logs = ''
    if os.path.exists(logs_path):
        with open(logs_path) as f:
            logs = f.read()
    return render_template_string(TEMPLATE, crew=crew, crew_header=crew_header, logs=logs)

if __name__ == '__main__':
    app.run(debug=True, port=5000)
