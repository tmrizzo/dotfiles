# vim:ft=sh
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# ~/.bashrc: executed by bash(1) for interactive shells.

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
# Re-edit failed history expansions and verify !! / !$ before running
shopt -s histreedit histverify
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell
# Same tolerance when tab-completing directory names
shopt -s dirspell
# Type a directory name alone to cd into it
shopt -s autocd
# **/*.conf matches recursively
shopt -s globstar
# A bare Tab on an empty line does not try to complete everything
shopt -s no_empty_cmd_completion
# Store multiline commands with real newlines in history
shopt -s lithist
# Programmable completion also works on aliases
shopt -s progcomp_alias

shopt -s checkwinsize

# Use the 256-color dircolors scheme when the terminal supports it
if [[ "$TERM" == *256color* ]] && [[ -f "${HOME}/.bashrc.d/dircolors.256dark" ]]; then
	eval "$(dircolors -b "${HOME}/.bashrc.d/dircolors.256dark")"
	# The scheme's di=38;5;33 (dark blue) is hard to read on dark terminals;
	# use a brighter blue for directories instead
	LS_COLORS="${LS_COLORS:+${LS_COLORS}:}di=01;38;5;75"
	# Same for its gray tones: plain files (244) and docs/configs (245) get
	# brighter variants. Junk files (*.bak, *.swp, 240) stay dim on purpose.
	LS_COLORS="${LS_COLORS//00;38;5;244/00;38;5;250}"
	LS_COLORS="${LS_COLORS//01;38;5;245/01;38;5;254}"
	export LS_COLORS
fi

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

# fzf: fuzzy finder key bindings (Ctrl-R history, Alt-C cd)
# Install: dnf install fzf
[[ -f /usr/share/fzf/shell/key-bindings.bash ]] && . /usr/share/fzf/shell/key-bindings.bash

# Make vim standard editor
export EDITOR=vim

# Make less the default pager
export PAGER=less

# Syntax-highlighted man pages via bat (when installed)
command -v bat >/dev/null 2>&1 && export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Use less pager with these options
export LESS='-RSJMsi'
# Stop less from creating its ~/.lesshst history file
export LESSHISTFILE=-

# less Colors for man Pages
# Set colors when using gnome-terminal and terminator
export GROFF_NO_SGR=1
# Begin blinking
#export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_mb=$'\e[1;32m'
# Begin bold
#export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_md=$'\e[1;32m'
# End mode
#export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_me=$'\e[0m'
# End standout-mode
#export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
# Begin standout-mode - info box
#export LESS_TERMCAP_so=$'\e[38;5;246m'
export LESS_TERMCAP_so=$'\e[01;33m'
# End underline
#export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
# Begin underline
#export LESS_TERMCAP_us=$'\e[04;38;5;146m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# History Options
# Ignore duplicates and spaces-prefixed lines; erase older duplicates.
export HISTCONTROL=ignoreboth:erasedups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
#export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'

# Ignore the ls command as well
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:history'

# Add the timestamp of each command in its history
export HISTTIMEFORMAT="%F %T "

# Set the number of lines or commands that are stored in memory in a history list
# while your bash session is ongoing
export HISTFILESIZE=1000000

# Set the number of lines or commands allowed in the history file at session
# startup, and stored in the history file at the end of your bash session
# for use in future sessions
export HISTSIZE=1000000

# Let the terminal / multiplexer set TERM; do not force xterm-256color.

# Correct TTY for pinentry (gpg and ssh-agent prompts)
GPG_TTY=$(tty 2>/dev/null) && export GPG_TTY

# Aliases
[[ -f "${HOME}/.bashrc.d/bash_aliases" ]] && . "${HOME}/.bashrc.d/bash_aliases"

# Functions
[[ -f "${HOME}/.bashrc.d/bash_functions" ]] && . "${HOME}/.bashrc.d/bash_functions"

# Prompts (sets PROMPT_COMMAND, including history -a)
[[ -f "${HOME}/.bashrc.d/bash_prompts" ]] && . "${HOME}/.bashrc.d/bash_prompts"

# Local env / secrets (gitignored) — brew shellenv lives here
[[ -f "${HOME}/.bashrc.d/secrets.vars" ]] && . "${HOME}/.bashrc.d/secrets.vars"

# PATH / MANPATH / INFOPATH (after brew so user bins win)
[[ -f "${HOME}/.bashrc.d/bash_path" ]] && . "${HOME}/.bashrc.d/bash_path"

# zoxide: smarter cd with history (z dotf)
# Install: dnf install zoxide
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"

# Umask
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
#umask 027

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt
export VAGRANT_PREFERRED_PROVIDERS=libvirt
