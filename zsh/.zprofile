# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew Python 3.X
export PATH="$(brew --prefix)/opt/python@3.12/libexec/bin:$PATH"

#Homebrew Go
export PATH="$(brew --prefix)/Cellar/go/1.23.3/libexec/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  tmux attach -t default || tmux new -s default
#fi
