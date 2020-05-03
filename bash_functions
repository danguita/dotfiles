# Attach single GNU screen through ssh
# usage: sshs user_name@server_name
sshs() { ssh -t "$1" screen -r; }

# Attach tmux session through ssh
# usage: ssht user_name@server_name session_name
ssht() { ssh -t "$1" tmux attach -t "$2"; }

# Reconnect or start a tmux or screen session over ssh
# usage: sssh user_name@server_name
# source: http://alias.sh/reconnect-or-start-tmux-or-screen-session-over-ssh
sssh() { ssh -t "$1" 'tmux attach || tmux new || screen -DR'; }
