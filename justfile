# Dotfiles management — run `just` (or `just --list`) to see recipes
# Requirements: GNU stow; optional: shellcheck (for `just lint`)

default:
    @just --list

# Verify required tools are installed
check:
    #!/usr/bin/env bash
    for cmd in stow git vim tmux; do
        command -v $cmd >/dev/null 2>&1 \
            || echo "MISSING: $cmd (dnf install $cmd)"
    done
    echo "check complete"

# Stow all packages into ~ and refresh the font cache
install: check
    stow -t ~ {{packages()}}
    fc-cache -f

# Re-create symlinks after adding files to a package
restow:
    stow -t ~ --restow {{packages()}}

# Pull, restow and reload caches — safe to run any time
update: restow
    git pull --ff-only
    fc-cache -f

# Lint all shell configuration files (needs shellcheck)
lint:
    #!/usr/bin/env bash
    command -v shellcheck >/dev/null 2>&1 || { echo "shellcheck not installed: dnf install shellcheck"; exit 1; }
    fail=0
    for f in bash/.bashrc bash/.bash_profile bash/.profile bash/.bashrc.d/* zsh/.zshrc zsh/.zshrc.d/*; do
        shellcheck -s bash "$f" || fail=1
    done
    exit $fail

# Show what a new machine needs
doctor:
    @echo "Required:  stow git vim tmux"
    @echo "Optional:  fzf zoxide bat fd-find ripgrep tealdeer duf dust btop lazygit just jq yq mtr"
    @echo "Enable:    just install"

# All stow packages, in one place
[private]
def packages():
    return "bash btop curl flatpak fontconfig git gtk konsole lazygit systemd tealdeer terminator tmux vim zsh"
