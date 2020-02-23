# /google/devshell/bashrc.google

[[ $- != *i* ]] && return

DOTFILES=${DOTFILES:-$HOME/src/dotfiles}
export DOTFILES

__detect_platform() {
  if [[ "$(hostname)" == *devshell* ]]; then
    DOTFILES_PLATFORM="cloudshell"
  elif [[ "$(uname -s)" == MINGW* ]] || [[ "$(uname -s)" == CYGWIN* ]]; then
    DOTFILES_PLATFORM="windows"
  elif [[ "$(uname -o)" == "Android" ]]; then
    DOTFILES_PLATFORM="termux"
  else
    DOTFILES_PLATFORM="other"
  fi
}

__load_platform_config() {
  local config="${DOTFILES}/platform/${DOTFILES_PLATFORM}/config"
  [[ -f "$config" ]] && . "$config"
}

__detect_platform
__load_platform_config

shopt -s checkwinsize

unset HISTFILE

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias g=git
alias gc='git clean -xdf'

alias ll='ls -ahl'

alias r!="exec $SHELL -l"

export EDITOR=vim
export VISUAL=vim

[[ -d "$DOTFILES/bin" ]] && \
  export PATH="$DOTFILES/bin:$PATH"

[[ -d "$HOME/.local/bin" ]] && \
  export PATH="$HOME/.local/bin:$PATH"

PS1="\[\e]0;\w\a\]"

if [[ "$EUID" == 0 ]]; then
  PS1+="\033[0;31m"
else
  PS1+="\033[0;34m"
fi

export PS1+="\w\033[0m \$ "
