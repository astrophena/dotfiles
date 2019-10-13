[[ -f /google/devshell/bashrc.google ]] && \
  . /google/devshell/bashrc.google

export XDG_CACHE_HOME="$(mktemp -d)"
export GOCACHE="$(mktemp -d)"

__cleanup() {
  rm -rf "$XDG_CACHE_HOME" "$GOCACHE"
}
trap __cleanup EXIT

export GOPROXY="https://proxy.golang.org"
