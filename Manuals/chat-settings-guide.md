# Chat Settings

Chat settings control the behavior, appearance, and context of chat-based agents or Copilot sessions.

## Common Settings
- **Persona:** Defines the agent's role or style
- **Context Window:** Sets how much history is retained
- **Tool/Skill Access:** Restricts or enables certain tools
- **Formatting:** Markdown, code, or plain text output

## Available Settings and Effects
| Setting         | Description                          | Example Value         |
|-----------------|--------------------------------------|----------------------|
| persona         | Agent's role or style                | "SupportBot"         |
| context_window  | Number of messages to retain         | 20                   |
| tools_enabled   | List of enabled tools/skills         | ["summarize-github-issue-pr-notification"] |
| output_format   | Output formatting style              | "markdown"           |

## Tips for Optimization
- Use a focused persona for support, coding, or summarization.
- Adjust context window for longer or shorter conversations.
- Enable only necessary tools for the workflow.

## Use Case Comparison Table
| Use Case      | Persona      | Context Window | Tools Enabled                  | Output Format |
|---------------|--------------|---------------|-------------------------------|--------------|
| Support Chat  | SupportBot   | 20            | summarize-github-issue-pr-notification | markdown     |
| Coding Help   | CodeHelper   | 10            | suggest-fix-issue             | code          |
| Summarization | Summarizer   | 5             | summarize-github-issue-pr-notification | plain text   |

## Example
```yaml
chat:
  persona: "SupportBot"
  context_window: 20
  tools_enabled:
    - summarize-github-issue-pr-notification
    - suggest-fix-issue
  output_format: "markdown"
```

## See Also
- [prompt-files-guide.md](prompt-files-guide.md)
- [custom-agents-guide.md](custom-agents-guide.md)
