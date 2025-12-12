#!/usr/bin/env bash

sleep 2

# Disable screen blanking
xset s off
xset s noblank
xset -dpms
# Set DPMS to 8 hours (28800 seconds)
xset dpms 28800 28800 28800

xinput --set-prop 13 "libinput Accel Speed" 0.4
xset m 5 1

sleep 2

if xrandr | grep "HDMI-1 connected"; then
  #   # Use 1:1 scaling for crisp display
  #   # xrandr --output HDMI-1 --scale 1.50x1.50 --mode 1920x1080 --right-of eDP-1 --rate x1080
  #
  #   # xrandr --output HDMI-1 --scale 1.0x1.0 --mode 1920x1080 --right-of eDP-1 --rate 120
  #
  #   # ~/.config/qtile/autostart.sh
  xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --same-as eDP-1
#   # for trackpad sens
fi
