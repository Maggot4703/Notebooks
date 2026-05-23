#!/usr/bin/env bash
set -euo pipefail

# Script to remove a broken CARDCUTTER submodule entry from the repository.
# Run locally from the repo root, review changes before pushing.

echo "Checking for CARDCUTTER/CardCutter submodule..."

# Try deinit and removal steps (safe to run even if submodule doesn't exist)
git submodule deinit -f -- CARDCUTTER/CardCutter 2>/dev/null || true

# Remove any gitlink for the path from the index
git rm -f --ignore-unmatch CARDCUTTER/CardCutter || true

# Remove section from .gitmodules if present
if [ -f .gitmodules ]; then
  git config -f .gitmodules --remove-section "submodule.CARDCUTTER/CardCutter" 2>/dev/null || true
  # If .gitmodules is now empty, remove it from index
  if ! grep -q "\[submodule" .gitmodules 2>/dev/null; then
    echo ".gitmodules appears empty after removal; removing from index"
    git rm --ignore-unmatch .gitmodules || true
  else
    git add .gitmodules || true
  fi
fi

echo "Done. Review 'git status' and commit any further changes if necessary."
