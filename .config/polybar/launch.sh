#!/usr/bin/env bash

killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar example &
#polybar bot &

echo "Bars launched..."
