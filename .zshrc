# show ASCII ART
echo "  .--------------.
  | happy coding |
  '--------------'
      ^      (\\_(\\
      '----- ( *.*) 
             o_(\")(\")" | lolcat

# figlet -f small "Yo Yo Yo it's humpday" | lolcat

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
alias ls="exa --icons"
alias cat="batcat"
alias extract='tar -zxvf'
alias compress="tar -czvf"
alias open="nautilus"
alias rmrf="rm -ri"
alias suspend="systemctl suspend"
alias c="clear"
alias switch-jdk="sudo update-alternatives --config java"

alias tmns="tmux new -s"
alias tmls="tmux list-sessions"

# show only file name when dealing with long paths in git
alias gss="git status --porcelain | cut -c 3- | xargs basename -a"

# pipe STDOUT to pipe alias to copy it
alias copy="xclip -sel clip"

# docker aliases
alias docker-ps="docker ps --format 'table {{.Names}}\t{{.Ports}}\t{{.Status}}'"


# search for directory using fd and open it using vim
function dvim() {
    local depth=${1:-5}  # Default depth is 3 if no argument provided

    local dir=$(fd -E node_modules -E dist -t d | awk -F/ -v depth="$depth" '{
        start = NF - depth + 1;
        if (start < 1) start = 1;
        path = $(start);
        for (i = start + 1; i <= NF; i++) {
            path = path "/" $i;
        }
        print $0 "\t" path;
    }' | fzf --keep-right --border=sharp --reverse --margin 1,10% --delimiter="\t" --with-nth 2 \
        --height=20 --prompt="  " --pointer="->" | cut -f1)

    if [[ -n "$dir" ]]; then
        nvim "$dir"
    fi
}

function fvim () {
    local depth=${1:-3}  # Default depth is 3 if no argument provided

    local file=$(fd -t f | awk -F/ -v depth="$depth" '{
        start = NF - depth + 1;
        if (start < 1) start = 1;
        path = $(start);
        for (i = start + 1; i <= NF; i++) {
            path = path "/" $i;
        }
        print $0 "\t" path;
    }' | fzf --keep-right --border=sharp --reverse --margin 1,5% --delimiter="\t" --with-nth 2 \
        --preview 'batcat --style=numbers --color=always --line-range :20 {1}' \
        --height=25 --prompt="  " --pointer="->" | cut -f1)

    if [[ -n "$file" ]]; then
        nvim "$file"
    fi
}

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

