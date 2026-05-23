# Performance Optimization Plan for Large Traveller Datasets

## 1. Profiling and Bottleneck Identification
- [ ] Use Python's cProfile or timeit to profile scripts (e.g., advanced_search_filter.py, load_sector_file.py) with large sector files
- [ ] Identify slowest functions (e.g., file reading, parsing, filtering)

## 2. Data Loading Improvements
- [ ] Use efficient file reading (e.g., with open(..., buffering=...) or mmap for very large files)
- [ ] Consider using pandas for large tabular data (if not already used)
- [ ] Stream/process data in chunks instead of loading all at once (for huge files)

## 3. Filtering and Search Optimization
- [ ] Use generator expressions or iterators to avoid unnecessary memory usage
- [ ] Pre-compile regex or search patterns if used repeatedly
- [ ] Avoid repeated computation in loops (cache or precompute where possible)

## 4. Output and Export
- [ ] Write output incrementally (line by line) for large result sets
- [ ] Allow user to limit output (e.g., --max-results)

## 5. Testing and Validation
- [ ] Test scripts with sector files >10,000 worlds
- [ ] Compare runtime and memory before/after changes

## 6. Documentation
- [ ] Document performance tips in README or script help

---

*Use this plan to guide incremental performance improvements for all Traveller data scripts and tools.*
