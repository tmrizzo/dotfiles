# dotfiles bootstrap — see README.md for details
# make check    verify required tools are installed
# make install  stow all packages into ~ and refresh the font cache
# make restow   re-create symlinks after adding files to a package

PACKAGES := bash curl fontconfig git gtk konsole terminator tmux vim zsh

.PHONY: check install restow

check:
	@for cmd in stow git vim tmux; do \
		command -v $$cmd >/dev/null 2>&1 \
			|| echo "MISSING: $$cmd (dnf install $$cmd)"; \
	done
	@echo "check complete"

install: check
	stow -t ~ $(PACKAGES)
	fc-cache -f

restow:
	stow -t ~ --restow $(PACKAGES)
