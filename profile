#!/bin/bash

# profile configuration
# When using i3 Window Manager you may need to adjust
# the session identification

# It should have been set by the login manager, according to the value of the DesktopNames found in the session file.
# the entry in the session file has multiple values separated in the usual way: with a semicolon.
#export CURRENT_SESSION=KDE
export XDG_CURRENT_DESKTOP=KDE

# Qt5
# Unlike Qt4, Qt5 doesn't ship a qtconfig utility to configure fonts, icons or styles. Instead, it will try to use
# the settings from the running DE. In KDE Plasma or GNOME this works well, but in other less popular DEs or WM in
# it can lead to missing icons in Qt5 applications. One way to solve this is to fake the running desktop environment
# by setting XDG_CURRENT_DESKTOP=KDE or GNOME, and then using the corresponding configuration application to set the
# desired icon set.
export QT_QPA_PLATFORMTHEME=qt5ct

# Enables automatic scaling, based on the pixel density of the monitor. This will not change the size of point sized
# fonts, since point is a physical unit of measure. Multiple screens may get different scale factors.
export QT_AUTO_SCREEN_SCALE_FACTOR=0
