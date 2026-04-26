# FetchDocs (ReadMine) User Guide

## Overview
FetchDocs (ReadMine) is a documentation scraping and aggregation tool integrated into Crew Manager. It allows users to fetch, organize, and view documentation from major programming sites and local sources, supporting both GUI and CLI workflows.

## Features
- Fetch documentation from online sources and local files
- Output in multiple formats (HTML, Markdown, plain text)
- Resume interrupted downloads
- Integrates with Crew Manager GUI (menu: Fetch Docs / ReadMine)

## How to Use
### GUI Usage
1. Open Crew Manager (Crew/Crew.py, no arguments for GUI mode).
2. In the menu, select **Fetch Docs (ReadMine)**.
3. Follow prompts to select sources and output format.
4. Progress and results will be displayed in the GUI.

### CLI Usage
(To be documented: add CLI usage instructions if available.)

## Configuration
- Configuration options are managed via the Crew Manager settings or config files.
- See [config.py](../Crew/config.py) for advanced options.

## Troubleshooting
- If documentation is not fetched, check your internet connection and source URLs.
- For errors, consult the log files or the error messages in the GUI.
- For advanced troubleshooting, see [error_handler.py](../Crew/error_handler.py).

## Example Usage
- Example screenshots and step-by-step walkthroughs will be added here.

---

**For Developers:**
- See [ReadMine.py](../Crew/ReadMine.py) for implementation details.
- Expand docstrings and comments as needed for maintainability.

---

*This guide will be updated as new features are added or workflows change.*
