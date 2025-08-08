# show ASCII ART
# echo "  .--------------.
#   | happy coding |
#   '--------------'
#       ^      (\\_(\\
#       '----- ( *.*) 
#              o_(\")(\")" | lolcat

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

alias k="kubectl"
alias d="docker"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/khalil/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/khalil/.opam/opam-init/init.zsh' ]] || source '/home/khalil/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

source <(kubectl completion zsh)

# pnpm
export PNPM_HOME="/home/khalil/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
