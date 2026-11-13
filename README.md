## dotfiles collection

My dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/) and
published at [tmrizzo/dotfiles](https://github.com/tmrizzo/dotfiles).

### Packages

`bash`, `zsh`, `vim`, `tmux`, `git`, `terminator`, `fontconfig`, `gtk`,
`konsole`, `curl`, `flatpak`, `systemd`, `btop`, `lazygit`, `tealdeer`, `tldr`,
`fonts`.
Every top-level directory is a stow package — new ones are picked up
automatically by `install.sh`.

### Installation

```
$ git clone https://github.com/tmrizzo/dotfiles ~/git/dotfiles
$ cd ~/git/dotfiles
$ ./install.sh
```

`install.sh` stows all packages and refreshes caches. Safe to re-run
(`--restow` is idempotent). Options:

```
./install.sh --list               list packages and optional tools
./install.sh --packages bash,vim  stow only these packages
./install.sh --tools              install the optional CLI tool belt (dnf)
./install.sh --secrets            create ~/.bashrc.d/secrets.vars from the example
./install.sh --flatpak            add the Flathub remotes
./install.sh --all                everything above
./install.sh --dry-run            show what would be done
```

Prefer manual stow? `stow -t ~ --restow vim` (or `*/` for everything).

### Requirements

**Required** — used directly by the configurations:

```
# dnf install stow git vim tmux terminator zsh bash-completion \
    fontconfig gnome-tweaks curl libnotify
```

`zsh` only if you use the `zsh` package (also needs
[oh-my-zsh](https://ohmyz.sh/) — see its site for install instructions).

**Optional** — features activate automatically when the tool is present:

```
# dnf install fzf zoxide bat fd-find ripgrep yt-dlp git-credential-libsecret \
    unzip p7zip p7zip-plugins unrar minikube podman toolbox
```

- `fzf` — fuzzy `Ctrl-R` history and `Alt-C` directory jump
- `zoxide` — smarter `cd` (`z dotf`)
- `bat` / `fd-find` / `ripgrep` — modern `cat` / `find` / `grep`; aliases
  switch over automatically
- `yt-dlp` — used by the `getmp3` alias
- `git-credential-libsecret` — persistent encrypted git credentials (enable
  with `git config --global credential.helper libsecret`; default is `cache`)
- archive tools for the `ex` extractor function; `minikube` completion ships
  in `bash/.bash_completion/`

**CLI tool belt** — `btop`, `lazygit`, `tealdeer` and `tldr` have dedicated
stow packages (config included); the rest are config-free:

```
# dnf install btop lazygit tealdeer duf dust jq yq mtr just shellcheck
```

| Tool | Purpose | Configuration |
|---|---|---|
| `btop` | resource monitor | `btop/.config/btop/btop.conf` — monokai theme, vim keys |
| `lazygit` | git TUI | `lazygit/.config/lazygit/config.yml` — monokai colors, vim editor |
| `tealdeer` | `tldr` cheat sheets | `tealdeer/.config/tealdeer/config.toml` — pager, weekly auto-update |
| `tldr` | official Python tldr client | `tldr/.config/environment.d/tldr.conf` — cache/env settings via `TLDR_*` vars |

`tealdeer` and `tldr` both provide the `tldr` command — install one or the
other, not both. After installing either, fetch the sheet cache once with
`tldr --update`.

### Post-install steps

1. **Local secrets** — the bash package expects `~/.bashrc.d/secrets.vars`
   (gitignored, never committed) for API keys, tokens and machine-specific
   environment:

   ```
   $ cp bash/.bashrc.d/secrets.vars.example ~/.bashrc.d/secrets.vars  # then edit
   $ chmod 600 ~/.bashrc.d/secrets.vars
   ```

2. **Fonts** — font families are managed by the `fonts` stow package
   (open-licensed, with license files; see `fonts/.local/share/fonts/README.md`)
   and land in `~/.local/share/fonts` automatically. Machine-local fonts can
   still be dropped there directly; run `fc-cache -f` after either way.

3. **Start a new shell** so `~/.bashrc` and `~/.inputrc` are picked up (or
   reload manually with `bind -f ~/.inputrc` and `src`).

### bash configuration layout

```
~/.bashrc.d/bash_aliases        # general aliases (+ .fedora / .ubuntu variants)
~/.bashrc.d/bash_functions      # helper functions
~/.bashrc.d/bash_env            # editor, pager, colors and misc environment
~/.bashrc.d/bash_path           # PATH / MANPATH / INFOPATH (single source of truth)
~/.bashrc.d/bash_prompts        # PROMPT_COMMAND, git prompt, terminal title
~/.bashrc.d/secrets.vars        # local secrets (gitignored)
~/.inputrc                      # readline: completion + history key bindings
~/.config/environment.d/        # systemd user session variables (Wayland/GDM)
```
