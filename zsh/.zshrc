# Config
export SYSTEMD_EDITOR='nvim'
export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER='nvim +Man!'

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
[[ -r ~/clones/znap/znap.zsh ]] ||
  git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git ~/clones/znap
source ~/clones/znap/znap.zsh

znap source hlissner/zsh-autopair
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting

eval "$(starship init zsh)"

# Language Support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Keybindings
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

