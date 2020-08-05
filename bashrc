# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Set up Cloud Shell environment if we are using it.
#
# Do it early to overwrite some defaults.
[[ -f /google/devshell/bashrc.google ]] &&
  . /google/devshell/bashrc.google

# See https://wiki.archlinux.org/index.php/XDG_Base_Directory.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Set the default editor.
export EDITOR=vim
export VISUAL=vim

# Add ~/bin and ~/.local/bin to PATH.
[[ -d "$HOME/bin" ]] &&
  export PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] &&
  export PATH="$HOME/.local/bin:$PATH"

# Set up local Go toolchain.
[[ -d "$HOME/.local/go" ]] &&
 export GOPATH="$HOME/src/go" &&
 export GO111MODULE=on &&
 export GOBIN="$HOME/.local/bin" &&
 export GOROOT="$HOME/.local/go" &&
 export PATH="$GOROOT/bin:$PATH"

# Set up rbenv.
[[ -d "$HOME/.rbenv" ]] &&
  export PATH="$HOME/.rbenv/bin:$PATH" &&
  eval "$(rbenv init -)"

# Update window size after every command.
shopt -s checkwinsize

# Prevent file overwrite on stdout redirection.
# Use `>|` to force redirection to an existing file.
set -o noclobber

# Case-insensitive globbing.
shopt -s nocaseglob;

# Perform file completion in a case insensitive fashion.
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent.
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press.
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to
# directories.
bind "set mark-symlinked-directories on"

# Prepend cd to directory names automatically.
shopt -s autocd 2> /dev/null

# Correct spelling errors during tab-completion.
shopt -s dirspell 2> /dev/null

# Correct spelling errors in arguments supplied to cd.
shopt -s cdspell 2> /dev/null

# Disable history persistence.
unset HISTFILE

# Set the prompt.

if [[ ! -z "$SSH_CONNECTION" ]]; then
  PS1="\[\e]0;\w ("$(hostname)")\a\]"
else
  PS1="\[\e]0;\w\a\]"
fi

if [[ "$EUID" == 0 ]]; then
  PS1+="\[\033[0;31m\]"
else
  PS1+="\[\033[0;34m\]"
fi

export PS1+="\w\[\033[0m\] -> "

# Automatically trim long paths in the prompt.
PROMPT_DIRTRIM=2

# Colorize ls and grep.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Short ls aliases.
alias l='ls -h'
alias ll='l -l'
alias la='l -a'

# Reload ~/.bashrc.
r() {
  exec "$SHELL" -l
}

# Quickly update dotfiles.
u() {
  ( cd "$HOME/src/dotfiles" && git pull ) && r
}

# No arguments: `git status`.
# With arguments: acts like `git`.
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

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
