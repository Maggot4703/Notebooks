#!/usr/bin/env bash
set -euo pipefail

# Debug run: create venv, install deps, start server, run pytest -vv, and collect logs/artifacts
python -m venv .venv || true
.venv/bin/python -m pip install --upgrade pip pytest requests playwright -q

# start server detached and log output
setsid .venv/bin/python 0101/src/public_html/server.py >/tmp/0101-server.log 2>&1 &
# give server a moment
sleep 1

# run all tests with verbose output
PYTHONPATH=0101/src/public_html .venv/bin/pytest -vv || rc=$?
rc=${rc:-0}

echo "pytest rc=${rc}"

# show server log tail
if [ -f /tmp/0101-server.log ]; then
  echo "--- /tmp/0101-server.log (last 200 lines) ---"
  tail -n 200 /tmp/0101-server.log || true
else
  echo "No server log found at /tmp/0101-server.log"
fi

# list e2e artifacts if present
if [ -d e2e/artifacts ]; then
  echo "--- e2e/artifacts ---"
  ls -la e2e/artifacts || true
fi

exit ${rc}
