plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Enable completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Optional tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. $(brew --prefix)/etc/profile.d/z.sh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:$HOME/.local/opt/go/bin

# Starship prompt (MUST BE LAST)
# eval "$(starship init zsh)"

eval "$(oh-my-posh init zsh --config ~/.poshthemes/catppuccin_mocha.omp.json)"

# bun completions
[ -s "/Users/alpha/.bun/_bun" ] && source "/Users/alpha/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# GitHub Personal Access Token for Claude Code

# export GITHUB_TOKEN="your_github_token_here"

# Exa API Key
export EXA_API_KEY="your_exa_api_key_here"