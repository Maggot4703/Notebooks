#!/bin/bash
# crew_run.sh - Run Crew as a module so relative imports work
cd "$(dirname "$0")"
exec python3 -m Crew.Crew "$@"
