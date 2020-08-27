#!/bin/bash
## GNOME Screenshot Window
DATE=$(date +%Y-%m-%d-%H:%M:%S)
gnome-screenshot -w -f ${HOME}/Pictures/Screenshot-$DATE.png
