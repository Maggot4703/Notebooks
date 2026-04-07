# Traveller Agent: Available Skills

The following skills are auto-discovered and available as agent commands and Python callables:

## TRAVELLERMAP Skills
- find-nearest-base-to
- advanced-search-filter
- export-plaintext-csv
- plot-sector-worlds-plotly
- export-image
- export-spreadsheet
- load-sector-file
- load-sector-file-with-travellerrpg
- watch-travellermap-github
- log-travellermap-api-changes
- export-pdf

## CREW Skills (prefix: crew-)
- crew-fetch-docs
- crew-bmp2png
- (and any other .py script in CREW/Crew/scripts or subfolders)

To see the full list, use:
```python
from traveller_agent import traveller_agent
print(traveller_agent.list_skills())
```

To get documentation for a skill:
```python
print(traveller_agent.get_doc('find-nearest-base-to'))
print(traveller_agent.get_doc('crew-fetch-docs'))
```
