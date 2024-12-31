# show ASCII ART
echo "  .--------------.
  | happy coding |
  '--------------'
      ^      (\\_(\\
      '----- ( *.*) 
             o_(\")(\")" | lolcat

# fastfetch --config examples/8 

export ZSH="$HOME/.oh-my-zsh"

# Path to your oh-my-zsh installation.
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting 
  F-Sy-H 
)

source $ZSH/oh-my-zsh.sh

alias l="exa -lg --icons"
alias la="exa -lag --icons"
alias ls="exa --icons"
alias cat="bat"
alias extract='tar -zxvf'
alias compress="tar -czvf"

# pipe STDOUT to pipe alias to copy it
alias copy="xclip -sel clip"

alias sessions="tmux list-sessions"
alias attach="tmux attach -t "
alias detach="tmux detach -s "
alias create="tmux new-session -s "
alias remove="tmux kill-session -t "


[ -f "/home/khalil/.ghcup/env" ] && . "/home/khalil/.ghcup/env" # ghcup-env
