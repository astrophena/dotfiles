# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# See https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

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
[[ -d "$HOME/bin" ]] &&
  export PATH="$HOME/bin:$PATH"

# Set up goenv.
export GOENV_ROOT="$XDG_DATA_HOME/goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# See https://golang.org/cmd/go/#hdr-Module_configuration_for_non_public_modules.
export GOPRIVATE="go.astrophena.me/x"

# Install binaries via `go get` and `go install` to ~/bin.
export GOBIN="$HOME/bin"

# Module-aware `go get` that installs binaries without debug info.
gg() {
  [[ -z "$1" ]] &&
    echo "usage: gg <import path>" && return 1
  tmp="$(mktemp -d)"
  pushd "$tmp" >/dev/null
  go mod init tmp
  go get -ldflags='-s -w' -trimpath "$1"
  popd >/dev/null
  rm -rf "$tmp"
}

# Short alias to code-server.
[[ -x "$XDG_DATA_HOME/code-server/code-server" ]] &&
  alias code="$XDG_DATA_HOME/code-server/code-server --auth none --disable-telemetry"

# Set up nvm.
export NVM_DIR="$XDG_DATA_HOME/nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] &&
  . "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] &&
  . "$NVM_DIR/bash_completion"

# Set up yarn.
[[ -d "$XDG_DATA_HOME/yarn/bin" ]] &&
  export PATH="$XDG_DATA_HOME/yarn/bin:$PATH"
[[ -d "$XDG_DATA_HOME/yarn/global/node_modules/.bin" ]] &&
  export PATH="$XDG_DATA_HOME/yarn/global/node_modules/.bin:$PATH"

# Colorize man pages.
man() {
  env \
    LESS_TERMCAP_mb="$(printf '\e[1;31m')" \
    LESS_TERMCAP_md="$(printf '\e[1;31m')" \
    LESS_TERMCAP_me="$(printf '\e[0m')" \
    LESS_TERMCAP_se="$(printf '\e[0m')" \
    LESS_TERMCAP_so="$(printf '\e[1;44;33m')" \
    LESS_TERMCAP_ue="$(printf '\e[0m')" \
    LESS_TERMCAP_us="$(printf '\e[1;32m')" \
    man "$@"
}
