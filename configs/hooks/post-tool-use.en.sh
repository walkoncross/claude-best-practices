#!/bin/bash
# Post Tool Use Hook Example
# Executed after tool usage

# Get tool information (from environment variables)
TOOL_NAME="${CLAUDE_TOOL_NAME}"
TOOL_RESULT="${CLAUDE_TOOL_RESULT}"

# Log file
LOG_FILE=".claude/tool-usage.log"

# Record tool usage
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Tool: $TOOL_NAME" >> "$LOG_FILE"

# Post-processing for specific tools
case "$TOOL_NAME" in
  "Edit"|"Write")
    # Auto-format after file modification
    echo "Running formatter..."
    # npm run format 2>/dev/null || true
    ;;
  "Bash")
    # Check after Bash command execution
    if [[ "$TOOL_RESULT" == *"error"* ]]; then
      echo "Warning: Bash command may have failed"
    fi
    ;;
esac

exit 0
