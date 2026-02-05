# Hooks Configuration Guide

Claude Code supports executing custom scripts at specific events through hooks.

## Configuration Location

Hooks are configured in the project's `.claude/settings.local.json` file:

```json
{
  "hooks": {
    "pre-tool-use": "./hooks/pre-tool-use.sh",
    "post-tool-use": "./hooks/post-tool-use.sh",
    "user-prompt-submit": "./hooks/user-prompt-submit.sh"
  }
}
```

## Available Hooks

### 1. pre-tool-use
Executed before tool invocation

**Use cases:**
- Validate operation permissions
- Check file status
- Log operations

### 2. post-tool-use
Executed after tool invocation

**Use cases:**
- Verify operation results
- Trigger subsequent operations
- Update status

### 3. user-prompt-submit
Executed when user submits a prompt

**Use cases:**
- Preprocess user input
- Add context information
- Validate requests

## Example Configuration

See example scripts in the `configs/hooks/` directory:
- `post-tool-use.sh` - Post tool use processing
- `README.md` - Detailed instructions (Chinese)
- `README.en.md` - Detailed instructions (English)

## Important Notes

- Hook scripts must have execute permissions: `chmod +x hook.sh`
- Hook failure will block the operation from continuing
- Use `exit 0` for success, `exit 1` for failure
