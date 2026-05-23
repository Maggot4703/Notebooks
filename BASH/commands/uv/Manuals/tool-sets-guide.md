# Tool Sets

Tool sets are collections of scripts, utilities, or plugins that extend agent or Copilot capabilities. They are referenced in agent, skill, or server configuration files.

## Structure
- **Definition:** YAML or JSON list of tools
- **Components:**
  - Name, description
  - Path or command
  - Associated skills or agents
  - Version

## Best Practices
- Use clear, descriptive tool names.
- Document tool usage and requirements.
- Version tools and update documentation when changes are made.

## Example
```yaml
tools:
  - name: "pdf-merge"
    command: "python merge_pdfs.py"
    version: "1.0"
  - name: "skill-lister"
    command: "python lister.py"
    version: "2.1"
```

## Sample Tool Set for Data Processing
```yaml
tools:
  - name: "csv-cleaner"
    command: "python clean_csv.py"
    version: "1.2"
  - name: "data-plotter"
    command: "python plot_data.py"
    version: "1.0"
```

## Usage
- Define in agent, skill, or server config
- Call from scripts or workflows

## See Also
- [skills-guide.md](skills-guide.md)
- [plugins-guide.md](plugins-guide.md)
