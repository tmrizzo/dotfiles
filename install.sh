#!/usr/bin/env bash
# install.sh — set up these dotfiles on a new system.
#
# Usage:
#   ./install.sh                    install all packages (default)
#   ./install.sh --list             list packages and optional tools
#   ./install.sh --packages a,b,c   install only these packages
#   ./install.sh --tools            install the optional CLI tool belt
#   ./install.sh --secrets          create ~/.bashrc.d/secrets.vars (edit after!)
#   ./install.sh --flatpak          add the Flathub remotes
#   ./install.sh --all              everything above
#   ./install.sh --dry-run          show what would be done
#
# Every directory in this repo is a stow package; new ones are picked up
# automatically. Safe to re-run at any time.

set -euo pipefail
cd "$(dirname "$0")"

# --- what exists here --------------------------------------------------------

# Packages that only make sense on this machine's desktop (gtk is written
# by KDE's settings tools); skip on non-Fedora or non-KDE systems if needed.
PACKAGES_ALL=(*/)
PACKAGES_ALL=("${PACKAGES_ALL[@]%/}")

REQUIRED_TOOLS=(stow git vim tmux)

OPTIONAL_TOOLS=(
	fzf zoxide bat fd-find ripgrep yt-dlp tealdeer
	btop lazygit duf dust jq yq mtr just shellcheck
	git-credential-libsecret
)

FLATPAK_REMOTES=(
	"flathub https://flathub.org/repo/flathub.flatpakrepo"
	"flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo"
)

# --- helpers ------------------------------------------------------------------

DRY_RUN=0
run() {
	if (( DRY_RUN )); then echo "  DRY-RUN: $*"; else "$@"; fi
}

have() { command -v "$1" >/dev/null 2>&1; }

is_fedora() { . /etc/os-release 2>/dev/null && [[ ${ID:-} == fedora ]]; }

usage() { sed -n '2,15p' "$0" | sed 's/^# \{0,1\}//'; }

list_things() {
	echo "Packages (stow):"
	printf '  %s\n' "${PACKAGES_ALL[@]}"
	echo
	echo "Optional tools (dnf):"
	printf '  %s\n' "${OPTIONAL_TOOLS[@]}"
}

# --- option parsing ------------------------------------------------------------

DO_STOW=1; DO_TOOLS=0; DO_SECRETS=0; DO_FLATPAK=0
SELECTED=()

while [ $# -gt 0 ]; do
	case "$1" in
		-h|--help)    usage; exit 0 ;;
		-l|--list)    list_things; exit 0 ;;
		-n|--dry-run) DRY_RUN=1 ;;
		--packages)   shift; IFS=',' read -ra SELECTED <<< "${1:-}"; DO_STOW=1 ;;
		--tools)      DO_TOOLS=1 ;;
		--secrets)    DO_SECRETS=1 ;;
		--flatpak)    DO_FLATPAK=1 ;;
		--all)        DO_TOOLS=1; DO_SECRETS=1; DO_FLATPAK=1 ;;
		*) echo "Unknown option: $1 (see --help)" >&2; exit 2 ;;
	esac
	shift
done

# --- core: requirements and stow ------------------------------------------------

if (( DO_STOW )); then
	echo "==> Checking requirements"
	missing=()
	for cmd in "${REQUIRED_TOOLS[@]}"; do
		have "$cmd" || missing+=("$cmd")
	done
	if [ ${#missing[@]} -gt 0 ]; then
		echo "    Missing: ${missing[*]}"
		if is_fedora && have sudo; then
			echo "    Installing with dnf..."
			run sudo dnf install -y "${missing[@]}"
		else
			echo "    Install them and re-run, e.g.: dnf install -y ${missing[*]}"
		fi
	fi

	echo "==> Stowing packages"
	targets=("${SELECTED[@]:-${PACKAGES_ALL[@]}}")
	for t in "${targets[@]}"; do
		[ -d "$t" ] || { echo "    No such package: $t (see --list)" >&2; exit 1; }
	done
	echo "    ${targets[*]}"
	run stow -t ~ --restow "${targets[@]}"

	echo "==> Refreshing caches"
	run fc-cache -f
	have tldr && run tldr --update || true
fi

# --- optional: secrets template ---------------------------------------------------

if (( DO_SECRETS )); then
	dest="$HOME/.bashrc.d/secrets.vars"
	if [ -f "$dest" ]; then
		echo "==> secrets.vars already exists (left untouched)"
	else
		echo "==> Creating $dest from the example"
		run cp bash/.bashrc.d/secrets.vars.example "$dest"
		run chmod 600 "$dest"
		echo "    Edit it now: vim $dest"
	fi
fi

# --- optional: CLI tool belt --------------------------------------------------------

if (( DO_TOOLS )); then
	echo "==> Installing optional CLI tools"
	tolist=()
	for t in "${OPTIONAL_TOOLS[@]}"; do
		have "$t" || tolist+=("$t")
	done
	if [ ${#tolist[@]} -eq 0 ]; then
		echo "    All optional tools already installed"
	elif is_fedora && have sudo; then
		run sudo dnf install -y "${tolist[@]}"
	else
		echo "    Install manually, e.g.: dnf install -y ${tolist[*]}"
	fi
fi

# --- optional: Flatpak remotes -------------------------------------------------------

if (( DO_FLATPAK )); then
	if have flatpak; then
		echo "==> Adding Flatpak remotes"
		for remote in "${FLATPAK_REMOTES[@]}"; do
			set -- $remote
			run flatpak remote-add --if-not-exists "$1" "$2"
		done
	else
		echo "==> flatpak not installed; skipping remotes (dnf install flatpak)"
	fi
fi

echo
echo "Done. Start a new shell (or run: src) to pick up the configuration."
