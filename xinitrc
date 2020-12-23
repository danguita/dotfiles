# Set up X input devices
"$HOME/bin/set-input-devices"

# Load .Xresources file
xrdb -merge "$HOME/.Xresources"

# Set background
xsetroot -solid black

# Launch a session bus instance
eval "$(dbus-launch --sh-syntax --exit-with-session)"

# Custom keybindings
xbindkeys &

# On-screen notifications
dunst &

# Status monitor
slstatus &

# Start window manager
exec dwm 2> ~/tmp/dwm.log
