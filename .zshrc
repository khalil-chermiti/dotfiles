# show ASCII ART
# echo "  .--------------.
#   | happy coding |
#   '--------------'
#       ^      (\\_(\\
#       '----- ( *.*) 
#              o_(\")(\")" | lolcat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  # zsh-autosuggestions
  zsh-syntax-highlighting 
  F-Sy-H 
)

source $ZSH/oh-my-zsh.sh

alias t1="exa -a --tree -L 1 --icons --group-directories-first"
alias t2="exa -a --tree -L 2 --icons --group-directories-first -I 'node_modules'"
alias t3="exa -a --tree -L 3 --icons --group-directories-first -I 'node_modules'" 
alias l="exa -lg --icons"
alias la="exa -lag --icons"
alias ls="exa --icons"
alias cat="batcat"
alias extract='tar -zxvf'
alias compress="tar -czvf"
alias open="nautilus"

alias tmns="tmux new -s"
alias tmls="tmux list-sessions"

# pipe STDOUT to pipe alias to copy it
alias copy="xclip -sel clip"

# docker aliases
alias docker-ps="docker ps --format 'table {{.Names}}\t{{.Ports}}\t{{.Status}}'"

# setting most as pager instead of less
export PAGER="most"


# Load Angular CLI autocompletion.
source <(ng completion script)

# Load aws autocompletion
complete -C aws_completer aws

# enable starship prompt
# eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/root/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# managing dotenv files
alias config='/usr/bin/git --git-dir=/home/khalil/dotfiles/ --work-tree=/home/khalil'

# bun completions
[ -s "/home/khalil/.oh-my-zsh/completions/_bun" ] && source "/home/khalil/.oh-my-zsh/completions/_bun"

# bun path
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Ocaml my caml
eval $(opam env)

# add neovim to path
export PATH="$PATH:/opt/nvim-linux64/bin"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


