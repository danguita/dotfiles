# Load X configuration
xrdb -merge "$HOME/.Xresources"

# Set up input devices
"$HOME/bin/set-input-devices"

# Use the systemd user session bus, overriding any stale dbus-launch address
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Source system xinitrc.d scripts (exports DISPLAY/XAUTHORITY to systemd and D-Bus)
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
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
