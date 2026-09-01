if [[ ! -v INSIDE_EMACS ]] then
   export ZSH="$HOME/.oh-my-zsh"

   ZSH_THEME="robbyrussell"

   plugins=(
       zsh-autosuggestions
       zsh-syntax-highlighting 
       F-Sy-H 
       colored-man-pages
   )

   source $ZSH/oh-my-zsh.sh
else
    if [[ -e "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
	source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    fi

    if [[ -e "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
	source "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    fi

    # Custom prompt for zsh in emacs.
    setopt PROMPT_SUBST

    # Capture exit code
    precmd() { RETVAL=$? }

    PROMPT=' %F{cyan}%c%f$(if [ $RETVAL -ne 0 ]; then echo " %F{red}✖ $RETVAL%f"; fi) '
fi

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

export FZF_DEFAULT_OPTS="--walker-skip .git,node_modules,target,dist,build,out"

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

# Prevent zsh from network searching a not found command.
command_not_found_handler() {
  echo "zsh: command not found: $1"
  return 127
}
