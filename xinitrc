# Load X configuration
xrdb -merge "$HOME/.Xresources"

# Set up input devices
"$HOME/bin/set-input-devices"

# Set background
xsetroot -solid black

# Key bindings
xbindkeys &

# Battery monitor
#batsignal &

# Window manager: run dunst and slstatus inside the D-Bus session so they
# register on the correct bus and don't trigger extra autolaunch instances.
exec dbus-launch --exit-with-session sh -c '
  dunst &
  slstatus &
  exec dwm
' 2> ~/tmp/dwm.log
