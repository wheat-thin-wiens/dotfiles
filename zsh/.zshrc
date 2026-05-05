# Config
export SYSTEMD_EDITOR='nvim'
export EDITOR='nvim'
export VISUAL='nvim'

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

# Plugins
source ~/clones/znap/znap.zsh

znap source hlissner/zsh-autopair
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting

eval "$(starship init zsh)"
# eval $(thefuck --alias)

# PNPM
export PNPM_HOME="/home/ewiens/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Additional Functions
# source ~/dev/bash/pystart.sh
# source ~/dev/c/cmake.sh
# source ~/dotfiles/theme-picker.sh
# source ~/dev/bash/nvimplug.sh

# Language Support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Alias
alias vim='nvim'
alias ls='eza'

alias avocado="~/dev/java/java.sh"
alias gogogo="~/dev/dotnet/C#.sh"
alias mc="mc --nosubshell"

# Keybindings
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

# Auto Run on Startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
 exec tmux
fi

#tmux
neofetch

# pnpm
export PNPM_HOME="/home/ewiens/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
