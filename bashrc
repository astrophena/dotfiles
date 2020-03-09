[[ $- != *i* ]] && return

shopt -s checkwinsize

unset HISTFILE

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias g=git
alias gc='git clean -xdf'

alias l='ls -h'
alias ll='l -l'
alias la='ll -a'

alias r!="exec $SHELL -l"

e() {
  "$EDITOR" "${1:-.}"
}

export EDITOR=vim
export VISUAL=vim

[[ -d "$HOME/.local/bin" ]] && \
  export PATH="$HOME/.local/bin:$PATH"

PS1="\[\e]0;\w\a\]"

if [[ "$EUID" == 0 ]]; then
  PS1+="\033[0;31m"
else
  PS1+="\033[0;34m"
fi

export PS1+="\w\033[0m \$ "
