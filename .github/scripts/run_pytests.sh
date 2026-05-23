set -euo pipefail
# Run tests from repo root so imports resolve; use Xvfb for GUI tests
echo "Running tests from repo root: $(pwd)"
# Run tests, but treat 'no tests collected' (pytest exit code 5) as non-fatal so CI doesn't fail when no tests exist
if xvfb-run -s "-screen 0 1400x900x24" pytest CREW/Crew -q; then
  exit 0
else
  rc=$?
  if [ "$rc" -eq 5 ]; then
    echo "pytest collected no tests (exit code 5). Treating as success for CI (no tests to run)."
    exit 0
  else
    echo "pytest failed with exit code $rc"
    exit $rc
  fi
fi
