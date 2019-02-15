#!/bin/bash

# Merge colors and settings
if [ -f "${HOME}/.Xresources" ] ; then
  xrdb "${HOME}/.Xresources"
fi

# Force KDE environment when running i3
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/
export DESKTOP_SESSION=kde
export XDG_CURRENT_DESKTOP=KDE
