---
name: traveller-sector-analysis
description: "Use when analyzing Traveller sector/world data, validating records, and summarizing findings."
model: GPT-5.3-Codex
---

# Traveller Sector Analysis

Goal:
- Analyze sector data quality and answer domain questions with traceable assumptions.

Inputs:
- Data source path
- Question type: nearest base, validation, filtering, summary

Required output:
1. Data assumptions
2. Validation findings
3. Query strategy
4. Final answer with confidence level
5. Follow-up checks

Constraints:
- Use explicit domain conventions.
- Flag uncertain or missing fields.
- Keep calculations transparent.
