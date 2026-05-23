Playwright MCP guidance

This file documents how to run Playwright-based end-to-end tests for the repository and how an MCP server should be configured.

Recommended MCP server role: "playwright" — a server that can run Playwright scripts (Chromium) against a local or deployed instance of the site.

Example commands (local):

- Install dependencies:
  python -m pip install --upgrade pip pytest requests playwright
  playwright install --with-deps

- Run tests (server must be running on port 8080):
  python src/public_html/server.py &
  pytest -q e2e

CI notes:
- The provided `.github/workflows/e2e.yml` starts the server in the background in CI, installs Playwright, and runs the `e2e/` test suite.
- MCP server should expose an agent that can execute the same commands and return test traces/artifacts.

MCP integration checklist:
- Ensure the agent image includes Python 3.10+ and the Playwright Python package.
- Provide `playwright install --with-deps` as part of setup.
- Provide network access between the agent and the service under test (localhost or an exposed URL).
- Capture artifacts (screenshots, page HTML) on failure for debugging.
