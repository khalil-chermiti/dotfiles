# show ASCII ART
echo "  .--------------.
  | happy coding |
  '--------------'
      ^      (\\_(\\
      '----- ( *.*) 
             o_(\")(\")" | lolcat

#figlet -f small "Happy  Coding" | lolcat

#fm6000 --say "Happy Coding!" --dog -c "random"

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
alias rmrf="rm -ri"
alias suspend="systemctl suspend"
alias c="clear"
alias switch-jdk="sudo update-alternatives --config java"

# show only file name when dealing with long paths in git
alias gss="git status --porcelain | cut -c 3- | xargs basename -a"

alias copy="xclip -sel clip"

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

# add gradle to path
export PATH=$PATH:/opt/gradle/gradle-7.6.2/bin

# managing dotenv files
alias config='/usr/bin/git --git-dir=/home/khalil/dotfiles/ --work-tree=/home/khalil'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# bun completions
[ -s "/home/khalil/.oh-my-zsh/completions/_bun" ] && source "/home/khalil/.oh-my-zsh/completions/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export FLUTTER_INSTALL="/opt/flutter"
export PATH="$FLUTTER_INSTALL/bin:$PATH"

