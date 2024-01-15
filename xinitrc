# Load X configuration
xrdb -merge "$HOME/.Xresources"

# Set up input devices
"$HOME/bin/set-input-devices"

# Set background
xsetroot -solid black

# Key bindings
xbindkeys &

# Battery monitor
batsignal &

# On-screen notifications
dunst &

# Status bar
slstatus &

# Window manager
exec dbus-launch --exit-with-session dwm 2> ~/tmp/dwm.log
