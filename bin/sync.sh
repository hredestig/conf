#!/bin/bash

export DISPLAY=":0.0"

/bin/mkdir -p "/media/redW"
/bin/mount "/dev/redW" "/media/redW"

unison redh2redW -batch

echo "10" | zenity --progress --pulsate --auto-close --title="redW sync" --text="Synchronizing..

