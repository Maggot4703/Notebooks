# Traveller Sector Tool Improvements Checklist

- [ ] **Flexible Input Parsing**
  - [ ] Detect sector/world order by matching against known sector names
  - [ ] Prompt user if ambiguous

- [ ] **Autocomplete/Validation**
  - [ ] Add tab-completion for sector/world names (e.g., readline/argcomplete)
  - [ ] Validate input and suggest corrections for typos

- [ ] **Rich Output**
  - [ ] Add --output option (html, md, json, text)
  - [ ] Generate styled HTML tables with map links
  - [ ] Generate Markdown tables for wiki/docs

- [ ] **Error Feedback**
  - [ ] Suggest close matches for not found (difflib)
  - [ ] List available sectors/worlds on invalid input

- [ ] **Batch Mode**
  - [ ] Accept file or comma-separated list of worlds
  - [ ] Output results for each world

- [ ] **Documentation**
  - [ ] Update help text and README for all features
  - [ ] Add usage examples for new modes

- [ ] **Web Integration**
  - [ ] Add Traveller Map links in HTML/Markdown output
  - [ ] Optionally embed map images/views

- [ ] **Unit Tests**
  - [ ] Use pytest to cover valid/invalid input, output formats, edge cases

- [ ] **User Customization**
  - [ ] Support config file (YAML/JSON/INI) for defaults
  - [ ] Load defaults at startup, override with CLI args
