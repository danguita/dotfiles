#!/usr/bin/env bash

set -e

VIM_FILES=${VIM_FILES:-$HOME/.vim}
EDITOR=${EDITOR:-vim}

say() {
  printf "[$(basename "$0")] %s\n" "$1"
}

plugin_install() {
  $EDITOR --headless "+Lazy! sync" +qa
  say "plugin_install: done."
}

plugin_update() {
  $EDITOR --headless "+Lazy! update" +qa
  say "plugin_update: done."
}

extension_update() {
  $EDITOR +CocUpdate +qa
  $EDITOR +CocUpdateSync +qa
  say "extension_update: done."
}

extension_install() {
  $EDITOR '+CocInstall -sync coc-snippets' +qa      # Various snippets
  $EDITOR '+CocInstall -sync coc-tsserver' +qa      # TS
  $EDITOR '+CocInstall -sync coc-solargraph' +qa    # Ruby
  $EDITOR '+CocInstall -sync coc-json' +qa          # JSON
  $EDITOR '+CocInstall -sync coc-rust-analyzer' +qa # Rust

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
