# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"


plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting 
  F-Sy-H 
)
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting F-Sy-H zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias t="tmux"
alias t1="exa -a --tree -L 1 --icons --group-directories-first"
alias t2="exa -a --tree -L 2 --icons --group-directories-first -I 'node_modules'"
alias t3="exa -a --tree -L 3 --icons --group-directories-first -I 'node_modules'" 
alias l="exa -lg --icons"
alias la="exa -lag --icons"
alias li="exa --icons"
alias cat="batcat"
alias extract='tar -zxvf'
alias compress="tar -czvf"
alias open="nautilus"
alias rmrf="rm -rf"
alias suspend="systemctl suspend"
alias c="clear"
alias ij="/opt/idea-IC-222.4167.29/bin/idea.sh"
alias switch-jdk="sudo update-alternatives --config java"

# setting most as pager instead of less
export PAGER="most"

# Load Angular CLI autocompletion.
source <(ng completion script)

# Load aws autocompletion
complete -C aws_completer aws

# enable starship prompt
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/root/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# managing dotenv files
alias config='/usr/bin/git --git-dir=/home/khalil/dotfiles/ --work-tree=/home/khalil'

# show ASCII ART
figlet -f smslant "Happy  Coding" | lolcat
