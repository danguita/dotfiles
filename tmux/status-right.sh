#!/usr/bin/env bash

TMUX_FILES="$DOTFILES/tmux"

segments=()
segments+=($(rainbarf))

echo $(printf " %s" "${segments[@]}")
