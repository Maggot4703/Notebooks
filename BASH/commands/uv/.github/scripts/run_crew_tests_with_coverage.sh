set -euo pipefail
cd CREW/Crew
coverage run -m pytest -q || true
coverage xml -o ../../ci-artifacts/coverage.xml || true
coverage html -d ../../ci-artifacts/coverage_html || true
pytest -q --junitxml=../../ci-artifacts/pytest-results.xml || true
