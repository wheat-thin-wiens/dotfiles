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

# Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
eval "$(starship init zsh)"
eval $(thefuck --alias)

# Additional Functions
source ~/dev/python/launch_python.sh
source ~/dotfiles/theme-picker.sh

# Language Support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /opt/homebrew/Cellar/chruby/0.3.9/share/chruby/auto.sh
source /opt/homebrew/Cellar/chruby/0.3.9/share/chruby/chruby.sh
chruby 3.3.3

# Alias
alias vim='nvim'
alias avocado="~/dev/java/java.sh"
alias gogogo="~/dev/dotnet/C#.sh"
# alias mc="mc --nosubshell"
# alias launch_python=". ~/dev/python/launch_python.sh"
alias matrix=". ~/dotfiles/matrix.sh"
alias run-ladybird="open -W --stdout $(tty) --stderr $(tty) .~/ladybird/Build/ladybird/bin/Ladybird.app"

# Keybindings
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

# Auto Run on Startup
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

#tmux
neofetch
