# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Update window size after every command.
shopt -s checkwinsize

# Disable history persistence.
unset HISTFILE

# Colorize ls and grep.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Set the prompt.
PS1="\[\e]0;\w\a\]"

if [[ "$EUID" == 0 ]]; then
  PS1+="\[\033[0;31m\]"
else
  PS1+="\[\033[0;34m\]"
fi

export PS1+="\w\033[0m \$ "

# Automatically trim long paths in the prompt.
PROMPT_DIRTRIM=2

# No arguments: `git status`.
# With arguments: acts like `git`.
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

# Short ls aliases.
alias l='ls -h'
alias ll='l -l'
alias la='ll -a'

# Reload ~/.bashrc.
alias r!="exec $SHELL -l"

# Set the default editor.
export EDITOR=vim
export VISUAL=vim

# Add ~/bin to PATH.
[[ -d "$HOME/bin" ]] && \
  export PATH="$HOME/bin:$PATH"

# Set up Go toolchain.
__go_root="$HOME/.local/go"
[[ -d "$__go_root" ]] && {
  # Set GOPATH to ~/src/go.
  export GOPATH="$HOME/src/go"
  # Set GOROOT.
  export GOROOT="$__go_root"
  # Add Go tools to PATH.
  export PATH="$__go_root/bin:$PATH"
  # See https://golang.org/cmd/go/#hdr-Module_configuration_for_non_public_modules.
  export GOPRIVATE="go.astrophena.me/experiments"
  # Install binaries via `go get` and `go install` to ~/bin.
  export GOBIN="$HOME/bin"
  # Module-aware `go get` that installs binaries without debug info.
  gg() {
    [[ -z "$1" ]] && \
      echo "usage: gg <import path>" && return 1
    tmp="$(mktemp -d)"
    pushd "$tmp" >/dev/null
    go mod init tmp
    go get -ldflags='-s -w' -trimpath "$1"
    popd >/dev/null
    rm -rf "$tmp"
  }
}

# See https://keybase.io/docs/linux-user-guide#configuring-kbfs.
[[ -d "/run/user/$(id -u)/keybase/kbfs" ]] && \
  export keybase="/run/user/$(id -u)/keybase/kbfs"
