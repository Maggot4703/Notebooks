Cleanup for broken CARDCUTTER submodule

Problem:
- CI logs showed: "fatal: No url found for submodule path 'CARDCUTTER/CardCutter' in .gitmodules" during actions/checkout.
- This means the repository may contain a broken submodule reference (gitlink) or a stale .gitmodules entry.

What this PR does:
- Adds a script at .github/scripts/remove-broken-submodules.sh to safely remove the broken CARDCUTTER/CardCutter submodule entry.
- Includes usage instructions below; the script does not auto-commit everything to avoid accidental destructive changes.

Recommended local steps to apply the cleanup (maintainer):
1. git fetch origin && git checkout -b fix/remove-broken-cardcutter
2. Run the cleanup script locally: bash .github/scripts/remove-broken-submodules.sh
3. Inspect git status and diff. If changes look correct, commit:
   git commit -m "Remove broken CARDCUTTER submodule entry\n\nCo-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"
4. Push and open PR; CI should no longer show the submodule warning.

Notes:
- This PR only adds the cleanup helper and instructions. Running the script and committing is left to a maintainer to verify.
- Alternatively, if the correct submodule URL is known, add it back to .gitmodules with the correct URL instead of removal.
