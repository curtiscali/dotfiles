#!/usr/bin/bash

#Locks the screen off and puts it to background
 swayidle \
       timeout 10 'swaymsg "output * dpms off"' \
       timeout 3600 'systemctl suspend' \
           resume 'swaymsg "output * dpms on"' &
 # Locks the screen immediately
swaylock -c 1B1C1F
# Kills last background task so idle timer doesn't keep running
kill %%
