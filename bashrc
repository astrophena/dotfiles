# /google/devshell/bashrc.google

# If not running interactively, don't do anything.
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
    DOTFILES_PLATFORM="generic"
  fi
}

__load_platform_bashrc() {
  local config="${DOTFILES}/platform/${DOTFILES_PLATFORM}/bashrc"
  [[ -f "$config" ]] && . "$config"
}

__detect_platform
__load_platform_bashrc

shopt -s checkwinsize

# Disable history saving.
unset HISTFILE

#
# Aliases
#

# Colorize ls and grep.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Short Git aliases.
alias g=git
alias gc='git clean -xdf'

# Short ls alias.
alias ll='ls -ahl'

# Reload ~/.bashrc.
alias r!="exec $SHELL -l"

#
# Environment variables
#

# Use vim as the default editor.
export EDITOR=vim
export VISUAL=vim

# Add $DOTFILES/bin to PATH.
[[ -d "$DOTFILES/bin" ]] && \
  export PATH="$DOTFILES/bin:$PATH"

#
# Set the prompt.
#

PS1="\[\e]0;\w\a\]"

if [[ "$EUID" == 0 ]]; then
  PS1+="\033[0;31m"
else
  PS1+="\033[0;34m"
fi

export PS1+="\w\033[0m \$ "
