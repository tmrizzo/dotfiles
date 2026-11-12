#!/bin/bash

# README
# The ~/.profile is used by many shells as fallback. This is used by X11.
# Wayland uses a different approach:
# create a .conf file in ~/.config/environment.d, containing lines of the
# form NAME=VAL. See man 5 environment.d. systemd 233 or later required.
#
# PATH is NOT set here. It is managed in a single place:
#   - interactive bash shells: ~/.bashrc.d/bash_path (sourced by ~/.bashrc)
#   - systemd user session:    ~/.config/environment.d/ (see bash package)

# Disable QT scale factor
# For per application configuration add env QT_AUTO_SCREEN_SCALE_FACTOR=0
# to the Exec line inside the app_name.desktop file in the directory:
# .local/share/applications or /usr/share/applications/
# Enables automatic scaling, based on the pixel density of the monitor. This
# will not change the size of point sized fonts, since point is a physical
# unit of measure. Multiple screens may get different scale factors.
export QT_AUTO_SCREEN_SCALE_FACTOR=0
