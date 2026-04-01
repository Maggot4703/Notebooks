# Detailed GitHub IDE Workflow

This workflow describes how to use GitHub and VS Code together for efficient development, issue tracking, and pull request management. It is tailored for users working with Copilot skills, agents, and custom workflows.

For a broader Git and GitHub guide that covers command-line workflows, pull and push behavior, advanced history rewriting, recovery, GitHub Actions, and IDE usage together, see `/home/me/Notebooks/Manuals/git-github-workflows.md`.

---

## 1. Project Setup

- **Clone the repository:**
  - Use the command palette or terminal: `git clone <repo-url>`
- **Open in VS Code:**
  - File → Open Folder, select your project directory.
- **Install recommended extensions:**
  - GitHub Pull Requests and Issues
  - Markdown Preview Enhanced
  - Python (if using Python)

---

## 2. Branching & Commits

- **Create a new branch for your work:**
  - `git checkout -b feature/your-feature`
- **Make changes:**
  - Edit code, documentation, or skills/agents as needed.
- **Stage and commit:**
  - Use the Source Control panel or terminal:
    - `git add .`
    - `git commit -m "Describe your change"`

---

## 3. Working with Issues

- **View issues:**
  - Use the GitHub Issues panel in VS Code.
- **Create or update issues:**
  - Use the panel or GitHub web UI.
- **Reference issues in commits:**
  - Include `Fixes #123` or `Closes #123` in your commit message.

---

## 4. Pull Requests (PRs)

- **Create a PR:**
  - Push your branch: `git push origin feature/your-feature`
  - Use the GitHub panel or web UI to open a PR.
- **Link issues:**
  - Reference related issues in the PR description.
- **Request reviews:**
  - Assign reviewers via the GitHub UI or mention them in comments.
- **Address feedback:**
  - Use the "address-pr-comments" skill for review comments.
  - Push updates to your branch; PR updates automatically.

---

## 5. Skill & Agent Integration

- **Selecting skills for workflow automation:**
  - Use the Skill Routing Guide (see `/Notebooks/.github/instructions/create.instructions.md`).
- **Add or update skills/agents:**
  - Place new skills in `/AI/skills/` with `SKILL.md` and implementation script.
  - Place new agents in `/AI/agents/` with `.agent.md` and documentation.
- **Document usage:**
  - Update markdown files for each skill/agent.

---

## 6. Markdown & Documentation

- **Preview markdown:**
  - `Ctrl+Shift+V` or use Markdown Preview Enhanced.
- **Export to PDF:**
  - Use the export feature in Markdown Preview Enhanced or Pandoc: `pandoc file.md -o file.pdf`

---

## 7. Merging & Cleanup

- **Merge PRs after approval:**
  - Use the GitHub UI or VS Code panel.
- **Delete merged branches:**
  - Clean up old branches locally and remotely.

---

## 8. Troubleshooting

- **Startup/environment issues:**
  - See `/Notebooks/.github/instructions/startup-environment.instructions.md` for root-cause diagnosis and minimal fixes.
- **Skill/agent issues:**
  - Use the "agent-customization" skill for debugging customization files.

---

## 9. Best Practices

- Write clear commit messages and PR descriptions.
- Keep branches focused and small.
- Use skills and agents to automate repetitive tasks.
- Keep documentation up to date.

---

## References

- [Skill Routing Guide](/Notebooks/.github/instructions/create.instructions.md)
- [Markdown Instructions](/Notebooks/markdown_instructions_and_example.md)
- [Startup Troubleshooting](/Notebooks/.github/instructions/startup-environment.instructions.md)

---

*Save this file as `github-ide-workflow.md` for future reference.*
