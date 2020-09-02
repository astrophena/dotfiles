#!/usr/bin/env bash

set -e

[[ -z "$DEBUG" ]] || set -x

no_color='\033[0m'

info() {
  local yellow_color='\033[0;33m'
  echo -e "${yellow_color}"$@"${no_color}"
}

error() {
  local red_color='\033[0;31m'
  echo -e "${red_color}"$@"${no_color}"
  exit 1
}

require_command() {
  command -v "$1" &>/dev/null || {
    error ""$2" is required. Install it and try again."
  }
}

[[ -d "$HOME/src/dotfiles" ]] &&
  error "dotfiles already installed. Run u to update them."

require_command "rcup"
require_command "git"
require_command "vim"
require_command "htop"

info "==> Cloning Git repository..."
git clone https://github.com/astrophena/dotfiles "$HOME/src/dotfiles"

info "==> Installing dotfiles..."
RCRC="$HOME/src/dotfiles/rcrc" rcup -f

info "==> Installing Vim plugins..."
vim -es -u ~/.vim/vimrc -i NONE -c "PlugInstall" -c "qa"
