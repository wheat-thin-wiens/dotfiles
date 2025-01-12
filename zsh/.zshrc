# History Config
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Homebrew Settings
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# Plugins
eval "$(starship init zsh)"
eval $(thefuck --alias)

# Additional Functions
source ~/dev/python/launch_python.sh
source ~/dev/c/cmake.sh
source ~/dotfiles/theme-picker.sh

# Language Support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Alias
alias vim='nvim'
alias avocado="~/dev/java/java.sh"
alias gogogo="~/dev/dotnet/C#.sh"
alias mc="mc --nosubshell"
# alias launch_python=". ~/dev/python/launch_python.sh"

# Keybindings
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

# Auto Run on Startup
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

#tmux
neofetch
