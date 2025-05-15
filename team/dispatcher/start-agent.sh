#!/bin/bash

# Get directory where script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create workspace directory relative to script location
WORKSPACE_DIR="${SCRIPT_DIR}/../../workspace"
mkdir -p "$WORKSPACE_DIR"
echo "Ensuring workspace directory exists at: $WORKSPACE_DIR"

# Path to system prompt file (relative to script dir)
SYSTEM_PROMPT_FILE="${SCRIPT_DIR}/system-prompt.md"

# Check if system prompt file exists
if [ ! -f "$SYSTEM_PROMPT_FILE" ]; then
  echo "System prompt file not found: $SYSTEM_PROMPT_FILE"
  exit 1
fi

# Read system prompt from file
SYSTEM_PROMPT=$(cat "$SYSTEM_PROMPT_FILE")

# Change directory to workspace before starting server
cd "$WORKSPACE_DIR"

# Start Claude MCP server with system prompt
claude mcp serve --system-prompt "$SYSTEM_PROMPT" --print --debug --verbose --mcp-debug