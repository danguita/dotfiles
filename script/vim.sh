#!/usr/bin/env bash

set -e

VIM_FILES=${VIM_FILES:-$HOME/.vim}
EDITOR=${EDITOR:-vim}

vim_plug_src="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

say() {
  printf "[$(basename "$0")] %s\n" "$1"
}

manager_install() {
  dest_file=$VIM_FILES/autoload/plug.vim
  if [ -f "$dest_file" ]; then
    say "error: already installed."
  else
    curl -fLo "$dest_file" --create-dirs "$vim_plug_src"
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

extension_update() {
  $EDITOR +CocUpdate +qa
  $EDITOR +CocUpdateSync +qa
  say "extension_update: done."
}

extension_install() {
  $EDITOR '+CocInstall -sync coc-tsserver' +qa
  $EDITOR '+CocInstall -sync coc-solargraph' +qa
  $EDITOR '+CocInstall -sync coc-json' +qa
  say "extension_install: done."
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
