---
name: "Create Skill Routing"
description: "Use when selecting a skill for GitHub issue, PR, or notification workflows."
---

# Skill Routing Guide

Use this guide to pick the correct skill quickly.

- agent-customization
  - Use for creating, updating, reviewing, or fixing customization files such as instructions, prompts, agents, and skills.
  - Example: Create a new instructions file for notebook JSON output.
  - Example: Debug why an applyTo pattern does not match expected files.

- summarize-github-issue-pr-notification
  - Use to summarize a GitHub issue, pull request, or notification thread.
  - Example: Summarize PR 142 and list blockers.

- suggest-fix-issue
  - Use to propose technical fixes from issue details.
  - Example: Suggest implementation and test changes from a bug report and stack trace.

- form-github-search-query
  - Use to convert natural language into strong GitHub issue or PR search queries.
  - Example: Find open PRs about notebook metadata regressions.

- show-github-search-result
  - Use to present GitHub search results in a clear markdown table.
  - Example: Show PR results grouped by status and last update.

## Quick Decision Rules

- Need to change Copilot behavior files: use agent-customization.
- Need an understanding summary: use summarize-github-issue-pr-notification.
- Need fix ideas from issue content: use suggest-fix-issue.
- Need a better GitHub query: use form-github-search-query.
- Need polished result display: use show-github-search-result.
