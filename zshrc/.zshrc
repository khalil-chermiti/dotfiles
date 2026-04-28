# show ASCII ART
echo "  .---------------.
  | HAPPY CODING! |
  '---------------'
      ^      (\\_(\\
      |_____ ( *.*) 
             o_(\")(\")" | lolcat -r

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

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

alias extract='tar -zxvf'
alias compress="tar -czvf"

alias clip="xclip -sel clip"

# alias ta="tmux attach -t"
# alias td="tmux detach -s"
# alias tn="tmux new -s"
# alias ts="tmux list-sessions"

alias v="nvim"

# source <(kubectl completion zsh)

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

