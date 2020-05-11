# Keyboard layout
setxkbmap -layout us -variant altgr-intl -option ctrl:nocaps

# Load .Xresources file
xrdb -merge ~/.Xresources

# Keyboard typematic delay and rate (defaults to: 660 25)
xset r rate 200 30

# Mouse acceleration and threshold
xset mouse 3/2 0

# Disable system bell
xset b off

# Do not disable TouchPad while typing
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Disable While Typing Enabled' 0

# Enable tap-to-click
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1

# Disable middle and right click in TouchPad area (defaults to: 1 2 3 4 5 6 7)
xinput set-button-map 'SynPS/2 Synaptics TouchPad' 1 1 1 4 5 6 7

# Disable mouse acceleration
xinput set-prop 'pointer:Logitech MX Master' 'libinput Accel Profile Enabled' 0, 1

# Set background
xsetroot -solid black

# Custom keybindings
xbindkeys &

# On-screen notifications
dunst &

# Status loop
while true
do
  "$HOME/bin/set-system-status"
  sleep 10s # Refresh interval
done &

# Start window manager
exec dwm 2> ~/tmp/dwm.log
