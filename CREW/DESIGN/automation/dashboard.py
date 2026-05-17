import csv
import os
from pathlib import Path
import logging

from flask import Flask, render_template_string

logger = logging.getLogger(__name__)
app = Flask(__name__)

# Simple HTML template for dashboard
TEMPLATE = """
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
        {% for row in crew %}<tr>{% for col in crew_header %}<td>{{ row.get(col, '') }}</td>{% endfor %}</tr>{% endfor %}
    </table>
    <h2>Recent Actions</h2>
    <pre>{{ logs }}</pre>
</body>
</html>
"""


def resolve_path(*parts) -> Path:
    """Resolve a path relative to the repository root (two levels up from this file).

    This is more robust than joining with .. strings and works when the file is executed
    from a different working directory.
    """
    # Repository root is three levels up from this file: /<repo-root>/CREW/DESIGN/automation
    base = Path(__file__).resolve().parents[3]
    return (base.joinpath(*parts)).resolve()


@app.route("/")
def dashboard():
    # Load crew assignments
    crew = []
    crew_header = []

    crew_path = resolve_path("CREW", "PLANS", "crew_roster_0426.csv")
    if crew_path.exists():
        try:
            with crew_path.open("r", encoding="utf-8") as f:
                reader = csv.DictReader(f)
                crew = list(reader)
                crew_header = reader.fieldnames or []
        except Exception as e:
            logger.exception("Failed to read crew CSV: %s", e)

    # Load logs (default to top-level notebooks.txt if available)
    logs = ""
    # Prefer repository-level notebooks.txt, fallback to CREW/DESIGN/NOTEBOOKS/notebooks.txt
    primary_logs = resolve_path("notebooks.txt")
    fallback_logs = resolve_path("CREW", "DESIGN", "NOTEBOOKS", "notebooks.txt")
    logs_path = primary_logs if primary_logs.exists() else fallback_logs
    if logs_path.exists():
        try:
            with logs_path.open("r", encoding="utf-8") as f:
                logs = f.read()
        except Exception as e:
            logger.exception("Failed to read logs: %s", e)

    return render_template_string(
        TEMPLATE, crew=crew, crew_header=crew_header, logs=logs
    )


if __name__ == "__main__":
    # Do not enable debug mode by default. Use environment variable CREW_DASH_DEBUG=1 to enable.
    debug = os.getenv("CREW_DASH_DEBUG", "0") == "1"
    host = os.getenv("CREW_DASH_HOST", "127.0.0.1")
    port = int(os.getenv("CREW_DASH_PORT", "5000"))
    app.run(debug=debug, host=host, port=port)
