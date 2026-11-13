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

# Environment: editor, pager, colors, misc (EDITOR, PAGER, LESS*, LS_COLORS, ...)
[[ -f "${HOME}/.bashrc.d/bash_env" ]] && . "${HOME}/.bashrc.d/bash_env"

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

# Aliases
[[ -f "${HOME}/.bashrc.d/bash_aliases" ]] && . "${HOME}/.bashrc.d/bash_aliases"

# Distro-specific aliases: detect the running distribution (see man os-release)
OSCODENAME=""
if [ -r /etc/os-release ]; then
	. /etc/os-release
	OSCODENAME="${ID:-}"
fi
case "$OSTYPE" in
	cygwin*) OSCODENAME="cygwin" ;;
esac
case "${OSCODENAME}" in
	fedora)
		[[ -f "${HOME}/.bashrc.d/bash_aliases.fedora" ]] && . "${HOME}/.bashrc.d/bash_aliases.fedora"
		;;
	debian|ubuntu|pop)
		[[ -f "${HOME}/.bashrc.d/bash_aliases.ubuntu" ]] && . "${HOME}/.bashrc.d/bash_aliases.ubuntu"
		;;
esac

# Functions
[[ -f "${HOME}/.bashrc.d/bash_functions" ]] && . "${HOME}/.bashrc.d/bash_functions"

# Prompts (sets PROMPT_COMMAND, including history -a)
[[ -f "${HOME}/.bashrc.d/bash_prompts" ]] && . "${HOME}/.bashrc.d/bash_prompts"

# Local env / secrets (gitignored) — brew shellenv lives in bash_path
[[ -f "${HOME}/.bashrc.d/secrets.vars" ]] && . "${HOME}/.bashrc.d/secrets.vars"

# Claude Code (Vertex) environment, if installed
[[ -f "${HOME}/.config/claude-code-vertex/env.sh" ]] && . "${HOME}/.config/claude-code-vertex/env.sh"

# PATH / MANPATH / INFOPATH (after brew so user bins win)
[[ -f "${HOME}/.bashrc.d/bash_path" ]] && . "${HOME}/.bashrc.d/bash_path"

# zoxide: smarter cd with history (z dotf)
# Install: dnf install zoxide
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"

# Umask
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
#umask 027
