alias word="/c/Program\ Files/Microsoft\ Office/Office14/WINWORD.EXE"

[[ -d "$HOME/Documents/Go" ]] && {
  export GOROOT="$HOME/Documents/Go"
  export GOPATH="$HOME/src/go"
  export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
}

export GNUPGHOME="$APPDATA/gnupg"
