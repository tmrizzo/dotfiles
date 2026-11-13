#!/usr/bin/env bash
# install.sh — stow every package and refresh caches. Safe to re-run.
# Every directory in this repo is a stow package; new ones are picked
# up automatically. See README.md for optional tooling.
set -euo pipefail
cd "$(dirname "$0")"

# Basic requirements
for cmd in stow git vim tmux; do
	command -v "$cmd" >/dev/null 2>&1 \
		|| echo "MISSING: $cmd (dnf install $cmd)"
done

# Stow (or re-stow) every package directory
stow -t ~ --restow */

# Refresh font cache and tldr sheets when available
fc-cache -f
command -v tldr >/dev/null 2>&1 && tldr --update || true

echo "Done. Start a new shell or run: src"
