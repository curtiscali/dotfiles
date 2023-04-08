 the screen off and puts it to background
 swayidle \
       timeout 10 'swaymsg "output * dpms off"' \
           resume 'swaymsg "output * dpms on"' &
 # Locks the screen immediately
swaylock --clock --indicator --screenshots --effect-scale 0.4 --effect-vignette 0.2:0.5 --effect-blur 4x2 --datestr "%a %B %d %Y" --timestr "%H:%M"
# Kills last background task so idle timer doesn't keep running
kill %%
