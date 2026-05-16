#!/usr/bin/env bash
set -euo pipefail

# Run repository linting tools locally (used by CI and developers)
python3 -m black .
python3 -m flake8 --max-line-length=88 --extend-ignore=E203,E501 .
