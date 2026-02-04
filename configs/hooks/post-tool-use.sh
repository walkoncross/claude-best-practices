#!/bin/bash
# Post Tool Use Hook 示例
# 在工具使用后执行

# 获取工具信息（从环境变量）
TOOL_NAME="${CLAUDE_TOOL_NAME}"
TOOL_RESULT="${CLAUDE_TOOL_RESULT}"

# 日志文件
LOG_FILE=".claude/tool-usage.log"

# 记录工具使用
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Tool: $TOOL_NAME" >> "$LOG_FILE"

# 特定工具的后处理
case "$TOOL_NAME" in
  "Edit"|"Write")
    # 文件修改后自动格式化
    echo "Running formatter..."
    # npm run format 2>/dev/null || true
    ;;
  "Bash")
    # Bash 命令执行后检查
    if [[ "$TOOL_RESULT" == *"error"* ]]; then
      echo "Warning: Bash command may have failed"
    fi
    ;;
esac

exit 0
