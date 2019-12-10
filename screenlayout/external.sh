#!/usr/bin/env sh

intern=eDP1
extern=HDMI1

xrandr --output "$intern" --off --output "$extern" --auto
