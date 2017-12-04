#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon="♫"

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#4F8F57}$icon $metadata"       # Blue when playing
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#65737E}$icon $metadata"       # Greyed out info when paused
else
    echo "%{F#65737E}"                 # Greyed out icon when stopped
fi

#else
#    echo "%{F#65737E}$icon"                 # Greyed out icon when stopped
#fi
