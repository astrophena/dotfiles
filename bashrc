[[ $- != *i* ]] && return

DOTFILES=${DOTFILES:-$HOME/src/dotfiles}
export DOTFILES

[[ "$(hostname)" == *devshell* ]] && \
  [[ -f "$DOTFILES/platform/cloudshell.bash" ]] && \
    . "$DOTFILES/platform/cloudshell.bash"

[[ "$(uname -s)" == MINGW* ]] || [[ "$(uname -s)" == CYGWIN* ]] && \
  [[ -f "$DOTFILES/platform/windows.bash" ]] && \
    . "$DOTFILES/platform/windows.bash"

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

alias g=git
alias ll='ls -ahl'
alias r!="exec $SHELL -l"

PS1="\[\e]0;\w\a\]"

if [[ "$EUID" == 0 ]]; then
  PS1+="\033[0;31m"
else
  PS1+="\033[0;34m"
fi

export PS1+="\w\033[0m \$ "

export EDITOR=vim
export VISUAL=vim
