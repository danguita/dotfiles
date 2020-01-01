#!/usr/bin/env sh

intern=eDP1
extern=HDMI1

xrandr --output "$intern" --primary --auto --pos 0x1080 --output "$extern" --auto --pos 0x0
