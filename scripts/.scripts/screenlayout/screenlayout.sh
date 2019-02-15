#!/bin/bash
# vim:foldmethod=marker:foldlevel=0

# HOME SETUP {{{
hlaptop(){
  xrandr --output eDP-1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DP-2-1 --off --output DP-2-2 --off --output VIRTUAL1 --off --output DP-1 --off --output DP-2 --off --output HDMI2 --off --output HDMI1 --off --output VGA1 --off
}

hdualright() {
  xrandr --output VIRTUAL1 --off --output eDP-1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2-1 --mode 1360x768 --pos 1600x0 --rotate normal --output DP-2-2 --off --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output VGA1 --off --output DP-2 --off
}

hdualleft() {
  xrandr --output VIRTUAL1 --off --output eDP-1 --primary --mode 1600x900 --pos 1680x0 --rotate normal --output DP-1 --off --output DP-2-1 --mode 1360x768 --pos 3280x0 --rotate normal --output DP-2-2 --mode 1680x1050 --pos 0x0 --rotate normal --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output VGA1 --off --output DP-2 --off
}

htriple() {
  xrandr --output VIRTUAL1 --off --output eDP-1 --primary --mode 1600x900 --pos 1680x0 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --mode 1680x1050 --pos 0x0 --rotate normal --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output VGA1 --off --output DP-2 --off
}
#}}}

# WORK SETUP {{{
wlaptop(){
  xrandr --output VIRTUAL1 --off --output eDP-1 --primary --mode 1920x1080 --pos 1440x0 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off
}

wdualright(){
  xrandr --output VIRTUAL1 --off --output eDP-1 --primary --mode 1920x1080 --pos 1440x0 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --mode 1440x900 --pos 3360x0 --rotate normal --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off
}

wtriple(){
  xrandr --output DP-2-1 --off --output DP-2-2 --mode 1440x900 --pos 3840x0 --rotate normal --output DP-2-3 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off --output DP-1 --off
}
#}}}

# REMOTE WORK SETUP {{{
rlaptop() {
  xrandr --output VIRTUAL1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off
}

rdualright() {
  xrandr --output VIRTUAL1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2-1 --mode 1360x768 --pos 1920x0 --rotate normal --output DP-2-2 --off --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off
}

rtriple() {
  xrandr --output VIRTUAL1 --off --output eDP-1 --primary --mode 1920x1080 --pos 1680x0 --rotate normal --output DP-1 --off --output DP-2-1 --mode 1360x768 --pos 3600x0 --rotate normal --output DP-2-2 --mode 1680x1050 --pos 0x0 --rotate normal --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off
}
#}}}

case $1 in
  hlap) hlaptop ;;
  hdr) hdualright ;;
  hdl) hdualleft ;;
  htp) htriple ;;
  wlap) wlaptop ;;
  wdr) wdualright ;;
  wtp) wtriple ;;
  rlap) rlaptop ;;
  rdr) rdualright ;;
  rtp) rtriple ;;
  *) echo "Usage"
esac

