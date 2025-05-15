#!/bin/bash

# Path to root system prompt file
SYSTEM_PROMPT_FILE="./root-system-prompt.txt"

# Check if system prompt file exists
if [ ! -f "$SYSTEM_PROMPT_FILE" ]; then
  echo "System prompt file not found: $SYSTEM_PROMPT_FILE"
  exit 1
fi

# Read system prompt from file
SYSTEM_PROMPT=$(cat "$SYSTEM_PROMPT_FILE")

# Start Claude MCP server with root system prompt
claude mcp serve --root-system-prompt "$SYSTEM_PROMPT"