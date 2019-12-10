#!/usr/bin/env sh

intern=eDP1
extern=HDMI1

xrandr --output "$extern" --off --output "$intern" --auto
