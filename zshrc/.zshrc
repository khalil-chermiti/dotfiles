export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting 
  F-Sy-H 
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

alias l="eza -lg --icons=always"
alias la="eza -lag --icons=always"
alias ls="eza --icons=always"
alias ll="eza -lgh --icons=always"

alias cat="bat"

alias clip="xclip -sel clip"

alias ta="tmux attach -t"
alias td="tmux detach -s"
alias tn="tmux new -s"
alias ts="tmux list-sessions"

alias v="nvim"
alias vim="nvim"

# zoxide
eval "$(zoxide init zsh)"
alias cd='z'

# fzf utils 

export FZF_DEFAULT_OPTS="--walker-skip .git,node_modules,target,dist,build,out"

f() {
  file="$(fd --type f --exclude node_modules | fzf)" || return
  [ -z "$file" ] && return
  nvim "$file"
}

d() {
  dir="$(fd --type d --exclude node_modules | fzf)" || return
  [ -z "$dir" ] && return
  cd "$dir" && nvim .
}

c() {
  dir="$(fd --type d --exclude node_modules | fzf)" || return
  [ -z "$dir" ] && return
  cd "$dir"
}

# adding local script to path
export PATH="$HOME/.local/bin:$PATH"

# Run Alacritty theme switcher if available
if [ -x "$HOME/.local/bin/alacritty-theme" ]; then
  "$HOME/.local/bin/alacritty-theme" >/dev/null 2>&1
fi

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# bun completions
[ -s "/home/khalil/.oh-my-zsh/completions/_bun" ] && source "/home/khalil/.oh-my-zsh/completions/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
