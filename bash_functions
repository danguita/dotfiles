# Attach single GNU screen through ssh
# usage: sshs user_name@server_name
sshs() { ssh -Yt "$1" screen -r; }

# Attach tmux session through ssh
# usage: ssht user_name@server_name session_name
ssht() { ssh -Yt "$1" tmux attach -t "$2"; }

# Reconnect or start a tmux or screen session over ssh
# usage: sssh user_name@server_name
# source: http://alias.sh/reconnect-or-start-tmux-or-screen-session-over-ssh
sssh() { ssh -Yt "$1" 'tmux attach || tmux new || screen -DR'; }

# Refresh X11 environment inside an existing tmux pane
# (useful after reattaching via ssh -Y when DISPLAY was not set originally)
# usage: x11refresh
x11refresh() {
  local display xauth
  display="$(tmux show-environment 2>/dev/null | grep '^DISPLAY=' | cut -d= -f2-)"
  xauth="$(tmux show-environment 2>/dev/null | grep '^XAUTHORITY=' | cut -d= -f2-)"
  [ -n "$display" ] && export DISPLAY="$display"
  [ -n "$xauth" ] && export XAUTHORITY="$xauth"
}
