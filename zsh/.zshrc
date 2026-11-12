# vim:ft=sh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="robbyrussell"
# ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# QoL options (parity with the bash package)
setopt auto_cd          # type a directory name alone to cd into it
setopt correct          # command typo correction
export LESSHISTFILE=-   # stop less from creating ~/.lesshst

# Use the 256-color dircolors scheme when the terminal supports it,
# with the same dark-terminal brightening as the bash package
if [[ "$TERM" == *256color* ]] && [[ -f "${HOME}/.bashrc.d/dircolors.256dark" ]]; then
	eval "$(dircolors -b "${HOME}/.bashrc.d/dircolors.256dark")"
	LS_COLORS="${LS_COLORS:+${LS_COLORS}:}di=01;38;5;75"
	LS_COLORS="${LS_COLORS//00;38;5;244/00;38;5;250}"
	LS_COLORS="${LS_COLORS//01;38;5;245/01;38;5;254}"
	export LS_COLORS
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Make vim standard editor
export EDITOR=vim

# Make less the default pager
export PAGER=less

# Syntax-highlighted man pages via bat (when installed)
command -v bat >/dev/null 2>&1 && export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Use less pager with these options
export LESS='-RSJMsi'

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases
#
# Some people use a different file for aliases
[[ -f "$HOME/.zshrc.d/zsh_aliases" ]] && . "$HOME/.zshrc.d/zsh_aliases"

# Functions
#
# Some people use a different file for functions
[[ -f "$HOME/.zshrc.d/zsh_functions" ]] && . "$HOME/.zshrc.d/zsh_functions"
#
# Regular expressions
#[[ -f "$HOME/.zshrc.d/zsh_regex" ]] && . "$HOME/.zshrc.d/zsh_regex"

# Set PATH so it includes user's private bins if they exist (idempotent,
# safe to re-source; mirrors ~/.bashrc.d/bash_path)
__path_prepend() {
	case ":${PATH}:" in
		*:"$1":*) ;;
		*) PATH="$1${PATH:+:$PATH}" ;;
	esac
}
__path_append() {
	case ":${PATH}:" in
		*:"$1":*) ;;
		*) PATH="${PATH:+$PATH:}$1" ;;
	esac
}

[ -d "$HOME/usr/bin" ] && __path_prepend "$HOME/usr/bin"
[ -d "$HOME/.local/bin" ] && __path_prepend "$HOME/.local/bin"
[ -d "$HOME/android-studio/bin" ] && __path_prepend "$HOME/android-studio/bin"
[ -d "$HOME/.lmstudio/bin" ] && __path_append "$HOME/.lmstudio/bin"

if [ -d "$HOME/usr/man" ]; then
	MANPATH="$HOME/usr/man:${MANPATH:-}"
fi

if [ -d "$HOME/usr/info" ]; then
	INFOPATH="$HOME/usr/info:${INFOPATH:-}"
fi

unset -f __path_prepend __path_append

# Umask
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
#umask 027

# Vagrant
# Global Vagrant variables
# Configures the default provider Vagrant will use.
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Configures providers that Vagrant should prefer
export VAGRANT_PREFERRED_PROVIDERS=libvirt
