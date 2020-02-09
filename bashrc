# Cloud Shell, don't fuck up with ~/.bashrc:
#  /google/devshell/bashrc.google
# With love, Ilya.

[[ $- != *i* ]] && return

DOTFILES=${DOTFILES:-$HOME/src/dotfiles}
export DOTFILES

__load_platform_config() {
  if [[ "$(hostname)" == *devshell* ]]; then
    local platform="cloudshell"
  elif [[ "$(uname -s)" == MINGW* ]] || [[ "$(uname -s)" == CYGWIN* ]]; then
    local platform="windows"
  elif [[ "$(uname -o)" == "Android" ]]; then
    local platform="termux"
  else
    local platform="generic"
  fi

  local config="$DOTFILES/platform/$platform/bashrc"
  [[ -f "$config" ]] && . "$config"
}
__load_platform_config

[[ -d "$DOTFILES/bin" ]] && \
  export PATH="$DOTFILES/bin:$PATH"

[[ -d "$HOME/bin" ]] && \
  export PATH="$HOME/bin:$PATH"

shopt -s checkwinsize

unset HISTFILE

alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

[[ -f "$HOME/src/diary/volumes/ii.md" ]] && \
  alias diary="$EDITOR $HOME/src/diary/volumes/ii.md"

alias g=git
alias gc='git clean -xdf'

alias ll='ls -ahl'
alias r!="exec $SHELL -l"

export EDITOR=vim
export VISUAL=vim

PS1="\[\e]0;\w\a\]"

if [[ "$EUID" == 0 ]]; then
  PS1+="\033[0;31m"
else
  PS1+="\033[0;34m"
fi

export PS1+="\w\033[0m \$ "
