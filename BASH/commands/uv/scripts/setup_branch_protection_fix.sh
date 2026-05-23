#!/usr/bin/env bash
# Improved branch protection setter using gh api with JSON payload
# Usage: scripts/setup_branch_protection_fix.sh <branch>
BRANCH=${1:-main}
if ! command -v gh >/dev/null 2>&1; then
  echo "gh CLI not found; cannot apply branch protection"
  exit 2
fi
OWNER_REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)
if [ -z "$OWNER_REPO" ]; then
  echo "Failed to determine repo owner/name"
  exit 3
fi

PAYLOAD=$(cat <<JSON
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["ci-lint","integration"]
  },
  "enforce_admins": true,
  "required_pull_request_reviews": null,
  "restrictions": null
}
JSON
)

echo "Applying branch protection for ${OWNER_REPO}:${BRANCH}"
# Use gh api to PUT the protection payload
gh api --method PUT "/repos/${OWNER_REPO}/branches/${BRANCH}/protection" -f raw="$PAYLOAD" || {
  echo "gh api call failed"
  exit 4
}

echo "Branch protection request completed (check repo settings)."
