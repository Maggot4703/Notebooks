set -euo pipefail
# Run tests from repo root so imports resolve; use Xvfb for GUI tests
echo "Running tests from repo root: $(pwd)"
xvfb-run -s "-screen 0 1400x900x24" pytest CREW/Crew -q
