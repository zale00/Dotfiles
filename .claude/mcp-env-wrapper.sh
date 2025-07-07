#!/bin/bash
# MCP Environment Wrapper - reads environment variables from shell

# Source shell configuration to get environment variables
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
fi

# Execute the MCP server with environment variables
exec "$@"