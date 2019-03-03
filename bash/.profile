#!/bin/bash

# Make vim standard editor
export EDITOR=vim

# Make less the default pager
export PAGER=less

# Use less pager with these options
export LESS=' -RSJMsi'

# less Colors for man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

# It should have been set by the login manager, according to the value of the DesktopNames found in the session file.
# the entry in the session file has multiple values separated in the usual way: with a semicolon.
#export XDG_CURRENT_DESKTOP=KDE
export XDG_CURRENT_DESKTOP=GNOME

# Qt5
# Unlike Qt4, Qt5 doesn't ship a qtconfig utility to configure fonts, icons or styles. Instead, it will try to use
# the settings from the running DE. In KDE Plasma or GNOME this works well, but in other less popular DEs or WM in
# it can lead to missing icons in Qt5 applications. One way to solve this is to fake the running desktop environment
# by setting XDG_CURRENT_DESKTOP=KDE or GNOME, and then using the corresponding configuration application to set the
# desired icon set.
export QT_QPA_PLATFORMTHEME=qt5ct

# Disable QT scale factor
# For per application configuration add env QT_AUTO_SCREEN_SCALE_FACTOR=0
# to the Exec line inside the app_name.desktop file in the directory:
# .local/share/applications or /usr/share/applications/
# Enables automatic scaling, based on the pixel density of the monitor. This will not change the size of point sized
# fonts, since point is a physical unit of measure. Multiple screens may get different scale factors.
export QT_AUTO_SCREEN_SCALE_FACTOR=0

