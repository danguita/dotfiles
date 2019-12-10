#!/usr/bin/env sh

intern=eDP1
extern=HDMI1

xrandr --output "$intern" --primary --auto --output "$extern" --right-of "$intern" --auto
