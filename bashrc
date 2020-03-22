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

export EDITOR=vim
export VISUAL=vim

[[ -d "$HOME/bin" ]] && \
  export PATH="$HOME/bin:$PATH"

if [[ -d "/usr/local/go" ]]; then
  export GOPATH="$HOME/src/go"
  export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"
  export GOPRIVATE="go.astrophena.me/experiments"
  export GOBIN="$HOME/bin"
  gg() {
    [[ -z "$1" ]] && \
      echo "Provide import path." && return 1
    tmp="$(mktemp -d)"
    pushd "$tmp" >/dev/null
    go mod init tmp
    go get -ldflags='-s -w' -trimpath "$1"
    popd >/dev/null
    rm -rf "$tmp"
  }
fi

[[ -d "/run/user/$(id -u)/keybase/kbfs" ]] && \
  export keybase="/run/user/$(id -u)/keybase/kbfs"

PS1="\[\e]0;\w\a\]"

if [[ "$EUID" == 0 ]]; then
  PS1+="\[\033[0;31m\]"
else
  PS1+="\[\033[0;34m\]"
fi

export PS1+="\w\033[0m \$ "
