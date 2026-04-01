# Git and GitHub Workflows

This guide explains how to use Git and GitHub together for real day-to-day work, from basic push and pull operations through advanced recovery, history rewriting, GitHub Actions, and IDE usage.

## 1. Git vs GitHub

- `Git` is the version-control tool running on your machine.
- `GitHub` is the hosted collaboration service where you push branches, open pull requests, review code, track issues, and run checks.

In practice:

- You use Git locally to inspect, branch, stage, commit, diff, merge, rebase, and recover work.
- You use GitHub to share that work, review it, discuss it, and merge it safely.

## 2. Core Concepts

- `working tree`: your current files on disk.
- `staging area`: the snapshot you are preparing for the next commit.
- `commit`: a saved point in project history.
- `branch`: a movable name pointing to a commit history.
- `HEAD`: what you currently have checked out.
- `remote`: a named repository location, usually `origin`.
- `remote-tracking branch`: Git's local record of a remote branch, such as `origin/main`.

Useful mental model:

- `git add` moves changes from working tree to staging area.
- `git commit` moves staged changes into project history.
- `git fetch` updates your remote-tracking branches.
- `git merge` or `git rebase` integrates history.
- `git push` sends your commits to GitHub.

### Simple flow diagram

```text
working tree -> git add -> staging area -> git commit -> local branch
local branch -> git push -> GitHub branch -> pull request -> merged branch
GitHub branch -> git fetch -> origin/main -> git merge or git rebase -> local branch
```

## 3. Initial Setup

### Check your identity

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
```

### Authenticate with GitHub

You can use either HTTPS with a credential manager or SSH keys.

HTTPS remote example:

```bash
git clone https://github.com/OWNER/REPO.git
```

SSH remote example:

```bash
git clone git@github.com:OWNER/REPO.git
```

Generate a new SSH key if needed:

```bash
ssh-keygen -t ed25519 -C "you@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Then add the public key shown by the last command to your GitHub account.

Test SSH access:

```bash
ssh -T git@github.com
```

If you use HTTPS and GitHub asks for credentials, use a personal access token instead of your account password when required by your setup.

### Clone a repository from GitHub

```bash
git clone https://github.com/OWNER/REPO.git
cd REPO
```

### Create a new local repository and connect GitHub later

```bash
mkdir my-project
cd my-project
git init
git remote add origin https://github.com/OWNER/REPO.git
```

### Inspect remote configuration

```bash
git remote -v
git remote show origin
```

### Switch a remote from HTTPS to SSH

```bash
git remote set-url origin git@github.com:OWNER/REPO.git
```

### Switch a remote from SSH to HTTPS

```bash
git remote set-url origin https://github.com/OWNER/REPO.git
```

### Sign commits with GPG or SSH

Signed commits help prove that a commit came from your account.

Check whether signing is already configured:

```bash
git config --global user.signingkey
git config --global commit.gpgsign
```

Enable commit signing by default:

```bash
git config --global commit.gpgsign true
```

If you use GPG signing, configure your key ID:

```bash
git config --global user.signingkey YOUR_GPG_KEY_ID
```

If you use SSH signing, configure the public key path:

```bash
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
```

Create a signed commit explicitly:

```bash
git commit -S -m "Docs: add signed commit guidance"
```

Verify signatures in history:

```bash
git log --show-signature -1
```

GitHub can display a `Verified` badge for correctly configured signed commits.

## 4. Inspecting Your Repository

### Check current state

```bash
git status
```

### List local and remote branches

```bash
git branch
git branch -r
git branch -a
```

### View history

```bash
git log
git log --oneline --graph --decorate --all
git show HEAD
```

### Inspect changes

```bash
git diff
git diff --staged
git diff main..feature/my-branch
```

### See who last changed a line

```bash
git blame path/to/file.py
```

## 5. Everyday Workflow

This is the safest default workflow for most GitHub projects.

### Update local default branch before new work

```bash
git switch main
git fetch origin
git pull --ff-only origin main
```

If the repository still uses `master`, replace `main` with `master`.

### Create a feature branch

```bash
git switch -c feature/add-git-guide
```

Suggested branch prefixes for this repository style:

- `feature/...` for new functionality
- `fix/...` for bug fixes
- `docs/...` for documentation-only changes
- `chore/...` for maintenance work
- `refactor/...` for code restructuring without behavior changes

### Stage and commit work

```bash
git status
git add Manuals/git-github-workflows.md
git commit -m "Add comprehensive Git and GitHub workflow guide"
```

Good commit message patterns:

- `Add comprehensive Git and GitHub workflow guide`
- `Fix broken startup command in notebook docs`
- `Docs: clarify pull request update workflow`

Useful rules:

- Write the subject line in imperative mood.
- Keep the first line concise.
- Make one commit represent one logical change where practical.
- If needed, add a blank line and a longer explanation in the commit body.

Example with a body:

```bash
git commit -m "Docs: expand Git authentication section" \
  -m "Add SSH setup, HTTPS guidance, and remote URL examples for GitHub use."
```

### Push branch to GitHub

```bash
git push -u origin feature/add-git-guide
```

`-u` sets the upstream so later pushes can usually be just `git push`.

### Open a pull request on GitHub

- Push the branch.
- Open GitHub.
- Create a pull request from `feature/add-git-guide` into `main`.
- Describe the change clearly.
- Reference issues if needed, for example `Fixes #123`.

### Update the branch after review

```bash
git switch feature/add-git-guide
git add .
git commit -m "Address PR review feedback"
git push
```

Any open GitHub pull request for that branch updates automatically after the push.

### Clean up after merge

```bash
git switch main
git pull --ff-only origin main
git branch -d feature/add-git-guide
git push origin --delete feature/add-git-guide
```

## 6. Pulling, Fetching, Merging, and Rebasing

### `git fetch` vs `git pull`

- `git fetch` downloads remote updates but does not change your current branch.
- `git pull` is usually `git fetch` followed by `git merge`.

Safer default:

```bash
git fetch origin
git log --oneline --graph --decorate HEAD..origin/main
```

Then choose how to integrate.

### Pull with fast-forward only

```bash
git pull --ff-only origin main
```

This refuses to create a merge commit during pull.

### Merge remote work into your branch

```bash
git fetch origin
git merge origin/main
```

Use merge when you want to preserve the exact branching history.

### Rebase your branch on updated main

```bash
git fetch origin
git rebase origin/main
```

Use rebase when you want a cleaner, linear history for your own branch.

### Resolve a merge conflict

1. Run the merge or rebase.
2. Open the conflicted files.
3. Choose or combine the correct content.
4. Mark the file resolved.

Merge example:

```bash
git add path/to/conflicted-file.md
git commit
```

Rebase example:

```bash
git add path/to/conflicted-file.md
git rebase --continue
```

Abort if needed:

```bash
git merge --abort
git rebase --abort
```

## 7. Useful Git Commands by Purpose

### Restore and discard changes

Restore an unstaged file back to the last committed version:

```bash
git restore path/to/file.md
```

Unstage a file without losing edits:

```bash
git restore --staged path/to/file.md
```

### Move and remove tracked files

```bash
git mv old-name.md new-name.md
git rm unwanted-file.md
```

### Stash temporary work

```bash
git stash push -m "WIP before switching branches"
git stash list
git stash pop
```

### Tag a release point

```bash
git tag v1.0.0
git push origin v1.0.0
```

### Work with remotes

```bash
git remote add upstream https://github.com/ORIGINAL/REPO.git
git remote set-url origin git@github.com:OWNER/REPO.git
git remote remove upstream
```

### Cherry-pick a specific commit

```bash
git cherry-pick abc1234
```

Use this when one specific commit should be copied to another branch.

### Clean untracked files carefully

Preview first:

```bash
git clean -nd
```

Delete after review:

```bash
git clean -fd
```

### Search for regressions with `bisect`

```bash
git bisect start
git bisect bad
git bisect good v1.0.0
```

Git will walk you through finding the commit that introduced a problem.

### Archive files without `.git`

```bash
git archive --format=zip --output=release.zip HEAD
```

### Work with submodules

```bash
git submodule update --init --recursive
git submodule status
```

## 8. Advanced History Rewriting

These commands are powerful. Use them carefully, especially if the branch is already shared.

### Amend the most recent commit

Change the commit message only:

```bash
git commit --amend -m "Better commit message"
```

Add forgotten staged changes to the last commit:

```bash
git add path/to/file.md
git commit --amend
```

### Interactive rebase

Rewrite the last 3 commits:

```bash
git rebase -i HEAD~3
```

Common actions in the rebase editor:

- `pick`: keep the commit.
- `reword`: keep the commit but change its message.
- `edit`: stop so you can modify it.
- `squash`: combine with the previous commit.
- `fixup`: combine and discard this commit message.
- `drop`: remove the commit.

### Split one commit into multiple commits

```bash
git rebase -i HEAD~3
```

Mark the commit as `edit`, then:

```bash
git reset HEAD^
git add part-one
git commit -m "First part"
git add part-two
git commit -m "Second part"
git rebase --continue
```

### Reorder or squash branch history before merge

```bash
git rebase -i origin/main
```

This is common before merging a feature branch.

### Force-push safely after rewriting

```bash
git push --force-with-lease
```

Prefer `--force-with-lease` over `--force` because it refuses to overwrite remote changes you did not know about.

## 9. Reset, Revert, and Reflog Recovery

### `git reset`

Move branch history pointer locally.

Keep commit changes staged:

```bash
git reset --soft HEAD~1
```

Keep commit changes unstaged:

```bash
git reset --mixed HEAD~1
```

Discard commit and working tree changes:

```bash
git reset --hard HEAD~1
```

Use `--hard` only when you truly want to destroy uncommitted local work.

### `git revert`

Create a new commit that undoes an old one:

```bash
git revert abc1234
```

This is the safer choice for commits that were already pushed to a shared branch.

### `git reflog`

Find previous HEAD positions after resets, rebases, or accidental branch moves:

```bash
git reflog
git reset --hard HEAD@{2}
```

This is often the fastest recovery tool after a mistake.

## 10. Git Internals That Matter in Practice

You do not need low-level plumbing commands for daily work, but these ideas matter.

### HEAD and refs

- `HEAD` usually points to the current branch.
- The branch points to the latest commit in that line of history.
- During detached HEAD state, `HEAD` points directly to a commit instead of a branch.

Detached HEAD example:

```bash
git checkout abc1234
```

If you want to keep new work from there, create a branch:

```bash
git switch -c rescue/detached-work
```

### Local branch vs remote-tracking branch

- `main` is your local branch.
- `origin/main` is your local record of the remote branch.
- `git fetch` updates `origin/main`.
- `git merge origin/main` or `git rebase origin/main` brings those changes into `main`.

### Merge base

Git finds the best common ancestor between two branches when merging or rebasing. This is why some conflicts appear even when each branch looks simple on its own.

## 11. GitHub Collaboration

### Reference issues in commits and pull requests

```text
Fixes #123
Closes #456
Refs #789
```

### Typical GitHub branch-to-PR flow

1. Create a local feature branch.
2. Commit work locally.
3. Push the branch to GitHub.
4. Open a pull request.
5. Review feedback, push more commits.
6. Merge once checks and reviews pass.

### Fork-based workflow

If you do not have direct push access:

```bash
git remote -v
git remote add upstream https://github.com/ORIGINAL/REPO.git
git fetch upstream
git rebase upstream/main
git push origin my-branch
```

Here:

- `origin` is your fork.
- `upstream` is the original repository.

### Branch protection and checks

GitHub may block direct pushes or merges until:

- required checks pass
- required reviews are completed
- the branch is up to date with the base branch

### Practical pull request checklist

Before opening or merging a pull request, check the following:

- the branch name clearly describes the change
- the PR targets the correct base branch
- `git status` is clean before the final push
- the diff only includes intended files
- the pull request title matches the actual change
- related issues are referenced when appropriate
- checks and tests are passing
- review comments are addressed
- temporary debug code, notes, or accidental files are removed

Useful final review commands:

```bash
git status
git diff origin/main...HEAD
git log --oneline --graph --decorate origin/main..HEAD
```

If the repository uses `master` instead of `main`, replace `origin/main` accordingly.

### Merge strategies on GitHub

- `Create a merge commit`: preserves branch history.
- `Squash and merge`: combines branch commits into one.
- `Rebase and merge`: replays commits linearly without a merge commit.

Pick the strategy that matches the repository's policy.

## 12. GitHub Actions Basics

GitHub Actions runs automation from workflow files stored in:

```text
.github/workflows/
```

### Minimal example workflow

```yaml
name: Markdown Check

on:
  push:
    branches: [main]
  pull_request:

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Show Markdown files
        run: find . -name "*.md" | sort
```

### Common triggers

- `push`: run after a push to selected branches.
- `pull_request`: run when a PR is opened, updated, or synchronized.
- `workflow_dispatch`: allow manual runs.

### Read a failed Actions run

1. Open the repository on GitHub.
2. Open the failed workflow run.
3. Open the failed job.
4. Expand the failing step.
5. Read the exact command and error output.

### Actions and pull requests

If checks are required, your PR may not merge until all required workflows pass.

## 13. VS Code and GitHub IDE Usage

### Source Control basics in VS Code

- Open the Source Control panel.
- Review changed files.
- Stage selected files or all files.
- Enter a commit message.
- Commit and sync.

### Good use cases for the VS Code UI

- reviewing diffs file by file
- staging individual hunks
- resolving merge conflicts visually
- creating or reviewing pull requests with the GitHub extension

### When terminal commands are still better

- interactive rebase
- reflog recovery
- bisect
- advanced remote configuration
- exact control over rebase, reset, cherry-pick, and force-push

### Useful VS Code flow

1. Pull or fetch latest changes.
2. Create a branch from the Source Control UI or terminal.
3. Edit files.
4. Review diffs in the editor.
5. Stage only the intended changes.
6. Commit.
7. Push and create a PR.

## 14. Troubleshooting and Recovery

### Condensed recovery table

| Problem | Quick action | Typical command |
| --- | --- | --- |
| Unstaged local edits should be discarded | Restore the file from the last commit | `git restore path/to/file` |
| File was staged by mistake | Unstage it, keep the edits | `git restore --staged path/to/file` |
| Last local commit should be redone | Move commit back but keep changes | `git reset --soft HEAD~1` |
| Pushed commit must be undone safely | Create a reversing commit | `git revert COMMIT` |
| Branch is behind remote | Fetch and rebase or merge | `git fetch origin && git rebase origin/main` |
| Push rejected after history rewrite | Push rewritten history safely | `git push --force-with-lease` |
| Need to switch branches with unfinished work | Stash work temporarily | `git stash push -m "WIP"` |
| Lost work after reset or rebase | Check reflog and restore | `git reflog` |
| Accidentally checked out a commit directly | Create a branch from detached HEAD | `git switch -c rescue/my-work` |
| Wrong commit belongs on another branch | Cherry-pick it to the correct branch | `git cherry-pick COMMIT` |
| Merge or rebase went bad | Abort the operation | `git merge --abort` or `git rebase --abort` |
| Untracked generated files should be removed | Preview, then clean | `git clean -nd` then `git clean -fd` |

### Push rejected because remote has new commits

```bash
git fetch origin
git rebase origin/main
git push
```

If you rewrote history locally:

```bash
git push --force-with-lease
```

### Committed on the wrong branch

If not pushed yet:

```bash
git branch rescue/wrong-branch
git switch correct-branch
git cherry-pick rescue/wrong-branch
```

### Need to undo the last local commit before push

```bash
git reset --soft HEAD~1
```

### Need to undo a commit that was already pushed

```bash
git revert abc1234
git push
```

### Lost work after reset or rebase

```bash
git reflog
git reset --hard HEAD@{1}
```

### Switched away but had unfinished work

```bash
git stash push -m "unfinished work"
git switch other-branch
git switch original-branch
git stash pop
```

### Stuck in detached HEAD

```bash
git switch -c rescue/my-detached-work
```

### Bad rebase started

```bash
git rebase --abort
```

### Want to see exactly what will be pushed

```bash
git log --oneline --graph --decorate @{u}..HEAD
```

## 15. Best Practices

- Use small, focused branches.
- Prefer branch names like `feature/...`, `fix/...`, `docs/...`, or `chore/...` so the branch purpose is obvious.
- Read `git status` before committing and before pushing.
- Review diffs before committing: `git diff` and `git diff --staged`.
- Prefer `git fetch` plus explicit merge or rebase when clarity matters.
- Prefer `git revert` for shared history instead of rewriting it.
- If you must rewrite published branch history, use `git push --force-with-lease`.
- Keep commit messages specific.
- Use the commit body when the why matters more than the what.
- Do not use `git add .` blindly in large repositories without checking what changed.
- Treat GitHub pull requests as review and integration points, not as backups for unreviewed work.

## 16. Quick Command Reference

```bash
git status
git switch -c feature/name
git remote -v
git add path/to/file
git commit -S -m "Message"
git commit -m "Message"
git push -u origin feature/name
git fetch origin
git pull --ff-only origin main
git merge origin/main
git rebase origin/main
git restore path/to/file
git restore --staged path/to/file
git reset --soft HEAD~1
git revert COMMIT
git reflog
git stash push -m "message"
git cherry-pick COMMIT
git log --oneline --graph --decorate --all
git log --show-signature -1
ssh -T git@github.com
```

## References

- For the existing IDE-oriented companion document, see [github-ide-workflow.md](/home/me/Notebooks/github-ide-workflow.md).
- For official Git documentation, see `git help <command>` in the terminal.
