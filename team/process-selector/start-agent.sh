#!/bin/bash

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Path to system prompt file
SYSTEM_PROMPT_FILE="${SCRIPT_DIR}/system-prompt.md"

# Check if system prompt file exists
if [ ! -f "$SYSTEM_PROMPT_FILE" ]; then
  echo "System prompt file not found: $SYSTEM_PROMPT_FILE"
  exit 1
fi

# Read system prompt from file
SYSTEM_PROMPT=$(cat "$SYSTEM_PROMPT_FILE")

# Start Process Selector MCP agent with system prompt
claude mcp connect process-selector --system-prompt "$SYSTEM_PROMPT"