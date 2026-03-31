# Checklist: Unit Tests for Traveller Tools

- [ ] Identify core functions and scripts to test (e.g., find_nearest_base_to.py, count_military_bases.py)
- [ ] Choose a Python testing framework (pytest recommended)
- [ ] Set up a tests/ directory with __init__.py
- [ ] Write unit tests for input parsing and normalization (case, whitespace, argument order)
- [ ] Write tests for sector/world lookup and fuzzy matching
- [ ] Test base distance calculations (edge cases, known results)
- [ ] Test error handling for invalid/missing input
- [ ] Add tests for output formats (text, JSON, HTML)
- [ ] Use mock data for reproducible results
- [ ] Integrate tests with CI (optional)
- [ ] Document test coverage and how to run tests in README
- [ ] Review and update tests as features evolve
