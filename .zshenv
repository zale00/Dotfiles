# ~/.zshenv - Sourced for ALL Zsh instances (including non-interactive shells)
# This ensures environment variables are available to all processes, including MCP servers

# GitHub MCP Server
export GITHUB_TOKEN="your_github_token_here"

# Exa Search MCP Server
export EXA_API_KEY="your_exa_api_key_here"

# Brave Search MCP Server
export BRAVE_API_KEY="your_brave_api_key"

# Optional: OpenAI API (if using certain MCP servers)
export OPENAI_API_KEY="your_openai_api_key"

# Optional: Anthropic API (if needed for certain tools)
export ANTHROPIC_API_KEY="your_anthropic_api_key"

# Optional: Perplexity API (for Task Master research features)
export PERPLEXITY_API_KEY="your_perplexity_api_key"

# Optional: Set default editor
export EDITOR="code"

# Optional: Add any other environment variables your MCP servers might need
# export SOME_OTHER_API_KEY="your_key_here"