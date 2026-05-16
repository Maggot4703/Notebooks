#!/usr/bin/env bash
# Usage: scripts/setup_branch_protection.sh <branch>
# Requires: gh CLI authenticated as a user with admin rights on the repo.

BRANCH=${1:-main}
REPO=$(git rev-parse --show-toplevel 2>/dev/null || echo ".")
echo "Setting branch protection on branch: $BRANCH"

# Example: require status checks 'ci-lint' and 'integration'
# This uses the GitHub CLI to call the REST API. Requires repo admin.

if ! command -v gh >/dev/null 2>&1; then
  echo "gh CLI not found. Install GitHub CLI and authenticate (gh auth login) and re-run."
  exit 2
fi

gh api --method PUT \
  -H "Accept: application/vnd.github+json" \
  /repos/$(gh repo view --json nameWithOwner -q .nameWithOwner)/branches/$BRANCH/protection \
  -f required_status_checks.contexts='["ci-lint","integration"]' \
  -f required_status_checks.strict=true \
  -f enforce_admins=true \
  -f required_pull_request_reviews.dismiss_stale_reviews=false \
  -f restrictions.users='[]' \
  -f restrictions.teams='[]'

echo "Branch protection request sent for $BRANCH (check gh api output above)."