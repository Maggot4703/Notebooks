#!/bin/bash
# Auto-update all .md files in the specified directory (e.g., run formatting, linting, or custom update logic)

TARGET_DIR="${1:-.}"

for file in "$TARGET_DIR"/*.md; do
  echo "Updating $file..."
  # Example: format with prettier (if installed)
  # prettier --write "$file"
  # Or run a custom Python script:
  # python3 update_markdown.py "$file"
  # Add your update logic here
  echo "$file updated."
done

echo "All markdown files updated."
