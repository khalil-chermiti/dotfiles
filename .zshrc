# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(zsh-autosuggestions zsh-syntax-highlighting F-Sy-H )
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

# oracle express 10g 
# alias oracle-start="sudo /etc/init.d/oracle-xe start"
# alias oracle-stop="sudo /etc/init.d/oracle-xe stop"
# alias oracle-reload="sudo /etc/init.d/oracle-xe force-reload"
# alias oracle-enable="sudo /etc/init.d/oracle-xe enable"
# alias oracle-disable="sudo /etc/init.d/oracle-xe disable"

# adding post man to path 
export PATH="$PATH:/usr/bin/Postman"

# setting most as pager instead of less
export PAGER="most"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
alias config='/usr/bin/git --git-dir=/home/khalil/dotfiles/ --work-tree=/home/khalil'

# show ASCII ART
figlet -f smslant "Happy  Coding" | lolcat
