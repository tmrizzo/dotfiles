#!/bin/bash
## GNOME Screenshot Area
DATE=$(date +%Y-%m-%d-%H:%M:%S)
gnome-screenshot -a -f ${HOME}/Pictures/Screenshot-$DATE.png
