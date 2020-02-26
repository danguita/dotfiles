#!/usr/bin/env sh

intern=eDP1
extern=HDMI1

xrandr --output "$intern" --auto --output "$extern" --auto --same-as "$intern"
