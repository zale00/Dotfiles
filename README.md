# Dotfiles

Personal configuration files for Zsh, Claude Code, and MCP servers.

## Files

- `.zshenv` - Environment variables (loaded for all Zsh instances)
- `.zshrc` - Zsh configuration
- `.claude.json` - Claude Code configuration and MCP server setup
- `.claude/CLAUDE.md` - Global Claude rules and MCP documentation
- `.claude/mcp-env-wrapper.sh` - MCP environment wrapper script

## Setup

1. Clone this repository
2. Update the API keys and tokens in `.zshenv`:
   - `GITHUB_TOKEN` - Your GitHub personal access token
   - `EXA_API_KEY` - Your Exa API key
   - Other API keys as needed

3. Symlink or copy the files to your home directory:
   ```bash
   ln -s $(pwd)/.zshenv ~/.zshenv
   ln -s $(pwd)/.zshrc ~/.zshrc
   ln -s $(pwd)/.claude.json ~/.claude.json
   ln -s $(pwd)/.claude ~/.claude
   ```

## Security Note

Never commit real API keys or tokens. Always use placeholders in version control.