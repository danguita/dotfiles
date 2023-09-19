# Load X configuration
xrdb -merge "$HOME/.Xresources"

# Set background
xsetroot -solid black

# Set up input devices
"$HOME/bin/set-input-devices"

# On-screen notifications
dunst &

# Status bar
polybar &

# Window manager
exec dbus-launch --exit-with-session cwm 2> ~/tmp/cwm.log
