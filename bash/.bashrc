# vim:ft=sh
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Allow ^D to exit the shell
set +o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

#
shopt -s checkwinsize

# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/profile.d/bash_completion.sh ]] && . /etc/profile.d/bash_completion.sh
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
# Don't add duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
#export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'

# Ignore the ls command as well
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:history'

# Add the timestamp of each command in its history
export HISTTIMEFORMAT="%F %T "

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Set the number of lines or commands that are stored in memory in a history list
# while your bash session is ongoing
export HISTFILESIZE=1000000

# Set the number of lines or commands allowed in the history file at session
# startup, and stored in the history file at the end of your bash session
# for use in future sessions
export HISTSIZE=1000000

# Set terminal to 256 colors mode
#export TERM=xterm
#export TERM=xterm-16color
export TERM=xterm-256color

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

# Disable QT scale factor
# For per application configuration add env QT_AUTO_SCREEN_SCALE_FACTOR=0
# to the Exec line inside the app_name.desktop file in the directory:
# .local/share/applications or /usr/share/applications/
# Enables automatic scaling, based on the pixel density of the monitor. This will not change the size of point sized
# fonts, since point is a physical unit of measure. Multiple screens may get different scale factors.
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# Aliases
#
# Some people use a different file for aliases
[[ -f "${HOME}/.bashrc.d/bash_aliases" ]] && . "${HOME}/.bashrc.d/bash_aliases"

# Functions
#
# Some people use a different file for functions
[[ -f "${HOME}/.bashrc.d/bash_functions" ]] && . "${HOME}/.bashrc.d/bash_functions"
#
# Regular expressions
#[[ -f "${HOME}/.bashrc.d/bash_regex" ]] && . "${HOME}/.bashrc.d/bash_regex"

# Prompts
#
# Some people use a different file for functions
[[ -f "${HOME}/.bashrc.d/bash_prompts" ]] && . "${HOME}/.bashrc.d/bash_prompts"

# Umask
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
umask 027

# Vagrant
# Global Vagrant variables
# Configures the default provider Vagrant will use.
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Configures providers that Vagrant should prefer
export VAGRANT_PREFERRED_PROVIDERS=libvirt