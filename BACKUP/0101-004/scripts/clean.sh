#!/usr/bin/env bash
set -euo pipefail

echo "Cleaning workspace: removing .venv, e2e/artifacts, and server log if present"
if [ -d ".venv" ]; then
  rm -rf .venv
  echo "Removed .venv"
else
  echo ".venv not present"
fi

if [ -d "e2e/artifacts" ]; then
  rm -rf e2e/artifacts
  echo "Removed e2e/artifacts"
else
  echo "e2e/artifacts not present"
fi

if [ -f "/tmp/0101-server.log" ]; then
  rm -f /tmp/0101-server.log
  echo "Removed /tmp/0101-server.log"
else
  echo "/tmp/0101-server.log not present"
fi

echo "Cleanup complete" 
