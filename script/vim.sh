#!/usr/bin/env bash

set -e

VIM_FILES=${VIM_FILES:-$HOME/.vim}
EDITOR=${EDITOR:-vim}
VIM_PLUG_SRC="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

say() {
  printf "[$(basename "$0")] %s\n" "$1"
}

manager_install() {
  dest_file=$VIM_FILES/autoload/plug.vim
  if [ -f "$dest_file" ]; then
    say "error: already installed."
  else
    curl -fLo "$dest_file" --create-dirs $VIM_PLUG_SRC
    say "manager_install: done."
  fi
}

manager_update() {
  $EDITOR +PlugUpgrade +qa
  say "manager_update: done."
}

plugin_install() {
  $EDITOR +PlugInstall +qa
  say "plugin_install: done."
}

plugin_update() {
  $EDITOR +PlugUpdate +qa
  say "plugin_update: done."
}

clean() {
  if [ -d "$VIM_FILES" ]; then
    rm -rf --interactive "$VIM_FILES"
    say "clean: done."
  else
    say "warning: $VIM_FILES is not there."
  fi
  say "clean: done."
}

"$1"