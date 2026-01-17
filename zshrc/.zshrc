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
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

alias l="exa -lg --icons"
alias la="exa -lag --icons"
alias ls="exa --icons"
alias ll="exa -lgh --icons"

# pring tree of level 1 if no argument is given else print tree of given level
lt() {
  if [ $# -eq 0 ]; then
    exa -T --level=1 --icons
  else
    exa -T --level=$1 --icons
  fi
}

alias cat="bat"

alias extract='tar -zxvf'
alias compress="tar -czvf"

# pipe STDOUT to pipe alias to copy it
alias clip="xclip -sel clip"

alias k="kubectl"
alias d="docker"

alias ta="tmux attach -t"
alias td="tmux detach -s"
alias tn="tmux new -s"
alias ts="tmux list-sessions"

alias hist='history | \
  fzf --height 40% \
      --border \
      --border-label=" COMMAND HISTORY " \
      --prompt=" Search history > " \
      --reverse \
      --tac \
      --color=border:bright-black | \
  sed -e "s/^ *[0-9]* *//" | \
  tr -d "\n" | \
  xclip -selection clipboard'

source <(kubectl completion zsh)

# pnpm
export PNPM_HOME="/home/khalil/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zoxide
eval "$(zoxide init zsh)"
alias cd='z'

# bun completions
[ -s "/home/khalil/.bun/_bun" ] && source "/home/khalil/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# adding go to path
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/workspace/go/gopath/bin
export GOPATH=$HOME/workspace/go/gopath


# # vi mode for zsh
# bindkey -v
#
# #vi mode indicator in prompt
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/N }/(main|viins)/I }"
#     RPS2=$RPS1
#     zle reset-prompt
# }
#
# zle -N zle-line-init
# zle -N zle-keymap-select
#
export PATH="$HOME/.local/bin:$PATH"

