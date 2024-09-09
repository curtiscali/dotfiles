#!/usr/bin/bash

#Locks the screen off and puts it to background
 swayidle \
       timeout 10 'swaymsg "output * power off"' \
       timeout 3600 'systemctl suspend' \
       resume 'swaymsg "output * power on"' \
       after-resume 'swaymsg reload'&
# Locks the screen immediately
swaylock -k -l --font "Cantarell Bold" --font-size 16 -i /home/cucali/Pictures/Lock_Screen_Backgrounds/gdm_background.png

# Kills last background task so idle timer doesn't keep running
kill %%;
