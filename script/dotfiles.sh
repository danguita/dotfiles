#!/usr/bin/env bash

set -e

DOTFILES=${DOTFILES:-$HOME/workspace/dotfiles}
MANIFEST="$DOTFILES/.dotfilesmanifest"
NS=${NS:-$HOME}

say() {
  printf "[$(basename "$0")] %s\n" "$1"
}

link() {
  orig_file=$1
  dest_file=$2

  mkdir -p "$(dirname "$orig_file")"
  mkdir -p "$(dirname "$dest_file")"

  ln -sfn "$orig_file" "$dest_file"
  say "link: $dest_file -> $orig_file"
}

unlink() {
  file=$1

  if [ ! -e "$file" ]; then
    say "warning: $file does not exist."
    return 0;
  fi

  if [ -h "$file" ]; then
    rm "$file"
    say "unlink: $file"
  else
    say "error: $file is not a symlink."
  fi
}

install() {
  grep -v '^ *#' < "$MANIFEST" | while IFS= read -r line; do
    IFS='|' read -r -a mapping <<< "$line"
    link "$DOTFILES/${mapping[0]}" "$NS/${mapping[1]}"
  done
  say "install: done."
}

update() {
  git pull origin master
  say "update: done."
}

clean() {
  grep -v '^ *#' < "$MANIFEST" | while IFS= read -r line; do
    IFS='|' read -r -a mapping <<< "$line"
    unlink "$NS/${mapping[1]}"
  done
  say "clean: done."
}

"$1"
