# show ASCII ART
# echo "  .--------------.
#   | happy coding |
#   '--------------'
#       ^      (\\_(\\
#       '----- ( *.*) 
#              o_(\")(\")" | lolcat

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

alias l="exa -lg"
alias la="exa -lag"
alias ls="exa"
alias cat="bat"
alias extract='tar -zxvf'
alias compress="tar -czvf"

# pipe STDOUT to pipe alias to copy it
alias copy="xclip -sel clip"

eval `ssh-agent` &> /dev/null
ssh-add ~/.ssh/github &> /dev/null

