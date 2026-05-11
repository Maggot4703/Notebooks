# traveller_agent Skill Registry

This registry is auto-generated and maintained by the agent. It lists all discovered skills/scripts in TRAVELLERMAP/scripts and their callable functions.

- To add a new skill, drop a .py script in scripts/ or its utils/ subfolder. The agent will auto-discover it.
- See `traveller_agent.py` for the agent implementation.
- See `USAGE_traveller_agent.md` for usage examples.

| Command Name              | Script Path                                      | Callable(s) Found         |
|--------------------------|--------------------------------------------------|---------------------------|
| find-nearest-base-to     | scripts/find_nearest_base_to.py                  | main, run_tests           |
| advanced-search-filter   | scripts/advanced_search_filter.py                | main, parse_args, matches_filters |
| export-plaintext-csv     | scripts/export_plaintext_csv.py                  | main, parse_args          |
| plot-sector-worlds-plotly| scripts/plot_sector_worlds_plotly.py             | main, fetch_sector_tab, parse_hex_coords, plot_sector |
| export-image             | scripts/export_image.py                          | main, parse_args          |
| export-spreadsheet       | scripts/export_spreadsheet.py                    | main, parse_args          |
| load-sector-file         | scripts/load_sector_file.py                      | main, load_sector_file    |
| load-sector-file-with-travellerrpg | scripts/load_sector_file_with_travellerrpg.py | main, fetch_travellerrpg_sector, load_sector_file |
| watch-travellermap-github| scripts/watch_travellermap_github.py             | check_github_releases, check_github_commits |
| log-travellermap-api-changes | scripts/log_travellermap_api_changes.py       | log_change                |
| export-pdf               | scripts/export_pdf.py                            | main, parse_args          |

