# fonts package

Font families installed to `~/.local/share/fonts` (XDG standard) via stow.

## Rules for adding fonts here

- **Open-licensed fonts only** (OFL, Apache, Ubuntu Font Licence, ...).
  Never add Microsoft, Apple, Graphik or other proprietary fonts — this
  repo is public and redistribution is not permitted.
- Keep each family in its own subdirectory and include its license file
  (`OFL.txt`, `LICENSE.txt`, ...) alongside the font files.
- Prefer the weights you actually use over full static families; git stores
  every binary forever.
- `.gitignore` in the repo root blocks the known-proprietary family names
  as a guardrail — don't work around it.

## Adding a family

1. Copy the family directory into `fonts/.local/share/fonts/` in this repo.
2. Re-run `./install.sh` (stow links the files into `~/.local/share/fonts/`).
3. Refresh the cache: `fc-cache -f`

## Note on existing installs

If `~/.local/share/fonts` already contains the same files as *real* files
(not symlinks), stow will conflict. Move the real files into this repo
directory first, then re-run `./install.sh`.
