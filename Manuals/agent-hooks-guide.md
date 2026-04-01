# Hooks

Hooks are automation triggers that run scripts or skills in response to specific events in an agent or workflow. They are defined in `.agent.md` or workflow configuration files.

## Common Hook Types
- **onStart:** Run when the agent starts
- **onError:** Run on error
- **onComplete:** Run on successful completion
- **onMessage:** Run on receiving a message
- **onExit:** Run when the agent exits

## Hook Execution Order
| Event      | Triggered Action         |
|------------|-------------------------|
| onStart    | Initialization          |
| onMessage  | Message processing      |
| onError    | Error handling          |
| onComplete | Post-processing         |
| onExit     | Cleanup                 |

## Security Notes
- Avoid running untrusted scripts in hooks.
- Validate input and output of hook-triggered actions.

## Example
```yaml
hooks:
  onStart: setup-skill
  onError: notify-skill
  onComplete: cleanup-skill
  onMessage: log-skill
  onExit: archive-skill
```

## Usage
- Add hooks to `.agent.md` or workflow YAML.
- Reference skills or scripts to execute for each event.

## See Also
- [custom-agents-guide.md](custom-agents-guide.md)
- [skills-guide.md](skills-guide.md)
