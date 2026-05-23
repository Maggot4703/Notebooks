# Autocomplete/Validation for Traveller Sector Tools

- [ ] Integrate tab-completion for sector and world names in CLI
  - [ ] Use Python's `readline` or `argcomplete` for argument completion
  - [ ] Maintain a list of known sector and world names for completion
- [ ] Validate user input against sector/world lists
  - [ ] If input is not found, suggest closest matches (e.g., using `difflib.get_close_matches`)
  - [ ] Print a clear error and list available options if input is invalid
- [ ] Add unit tests for completion and validation logic
- [ ] Document autocomplete and validation features in help text and README
