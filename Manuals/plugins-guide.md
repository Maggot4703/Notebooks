# Plugins

Plugins are modular extensions that add new features, integrations, or tools to Copilot, agents, or MCP servers.

## Features
- Extend core functionality
- Integrate with external APIs or services
- Provide new skills, tools, or hooks
- Support versioning and compatibility checks

## Plugin Lifecycle
- **Install:** Add plugin code to the plugins directory
- **Enable:** Register in MCP server or agent config
- **Update:** Replace code and update version
- **Remove:** Delete from directory and config

## Compatibility Notes
- Check plugin compatibility with MCP server and agent versions.
- Document supported versions in plugin README.

## Troubleshooting
- Check logs for plugin errors.
- Ensure correct paths and permissions.

## Example
```yaml
plugins:
  - name: "github-integration"
    path: "/plugins/github"
    version: "1.0"
  - name: "pdf-tools"
    path: "/plugins/pdf-tools"
    version: "2.1"
```

## See Also
- [mcp-servers-guide.md](mcp-servers-guide.md)
- [tool-sets-guide.md](tool-sets-guide.md)
