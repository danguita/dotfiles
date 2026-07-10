# Load X configuration
xrdb -merge "$HOME/.Xresources"

# Set up input devices
"$HOME/bin/set-input-devices"

# Source system xinitrc.d scripts if present (e.g. for DISPLAY/XAUTHORITY setup)
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start D-Bus session bus on non-systemd systems (e.g. Void Linux)
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
    export DBUS_SESSION_BUS_ADDRESS
fi

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
exec dwm 2> ~/tmp/dwm.log
