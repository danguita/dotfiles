#!/usr/bin/env bash

TMUX_FILES="$DOTFILES/tmux"

source "$TMUX_FILES/config/shell.sh"
source "$TMUX_FILES/segments/lan_ip.sh"
source "$TMUX_FILES/segments/ifstat_sys.sh"

segments=()

#segments+=($(run_lan_ip_segment))
#segments+=($(run_ifstat_sys_segment))

if shell_is_osx ; then
  segments+=($("$TMUX_FILES/segments/np_itunes.script"))
  segments+=($("$TMUX_FILES/segments/np_spotify_mac.script"))
fi

segments+=($(rainbarf))

echo $(printf " %s" "${segments[@]}")
