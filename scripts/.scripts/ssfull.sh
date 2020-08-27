#!/bin/bash
## GNOME Screenshot Screen
DATE=$(date +%Y-%m-%d-%H:%M:%S)
gnome-screenshot -f ${HOME}/Pictures/Screenshot-$DATE.png
