## dotfiles collection

This is my dotfiles collection, a set of configuration files I use to customize different tools.

### Packages

Managed dotfile packages: `bash`, `zsh`, `vim`, `tmux`, `git`, `terminator`, `fontconfig`, `gtk`, `konsole`, `curl`, `flatpak`, `systemd`, `btop`, `lazygit`, `tealdeer`.

**Required** — used directly by the configurations:

```
# dnf install stow git vim tmux terminator zsh bash-completion \
    fontconfig gnome-tweaks curl libnotify
```

- `stow` — installs/symlinks the dotfiles
- `bash-completion` — sourced by `~/.bashrc`
- `fontconfig` — `fc-cache` for the font setup
- `libnotify` — `notify-send`, used by the `timer` shell function
- `zsh` — only if you use the `zsh` package (also needs [oh-my-zsh](https://ohmyz.sh/): `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`)

**Optional** — features activate automatically when the tool is present:

```
# dnf install fzf zoxide bat fd-find ripgrep yt-dlp git-credential-libsecret
```

- `fzf` — fuzzy `Ctrl-R` history and `Alt-C` directory jump (`~/.bashrc`)
- `zoxide` — smarter `cd` (`z dotf`, `~/.bashrc`)
- `bat` / `fd-find` / `ripgrep` — modern `cat` / `find` / `grep`; related aliases
  switch over automatically (`~/.bashrc.d/bash_aliases`)
- `yt-dlp` — used by the `getmp3` alias
- `git-credential-libsecret` — persistent encrypted git credentials
  (enable with `git config --global credential.helper libsecret`; the
  default is the in-memory `cache` helper)

**CLI tool belt** — `btop`, `lazygit` and `tealdeer` have dedicated stow
packages (config included); the rest are config-free and work out of the box:

```
# dnf install btop lazygit tealdeer duf dust jq yq mtr just
```

| Tool | Purpose | Configuration |
|---|---|---|
| `btop` | resource monitor | `btop/.config/btop/btop.conf` — monokai theme, vim keys |
| `lazygit` | git TUI | `lazygit/.config/lazygit/config.yml` — monokai colors, vim editor |
| `tealdeer` | `tldr` cheat sheets | `tealdeer/.config/tealdeer/config.toml` — pager, weekly auto-update |
| `duf` / `dust` | modern `df` / `du` | guarded aliases: `df`→`duf`, `du`→`dust` when installed |
| `jq` / `yq` | JSON / YAML wrangling | no config needed |
| `mtr` | traceroute + ping live | no config needed |
| `just` | command runner | no shared config — per-project `justfile`s |

After installing tealdeer, fetch the sheet cache once with `tldr --update`.

**Optional** — used by specific aliases/functions only:

```
# dnf install unzip p7zip p7zip-plugins unrar minikube podman toolbox
```

- archive tools for the `ex` extractor function (`unzip`, `p7zip*`, `unrar`)
- `minikube` — completion shipped in `bash/.bash_completion/`

### Installation

- Use [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles.
- Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place
- `install.sh` automates a new-system setup:

```
$ git clone https://github.com/tmrizzo/dotfiles ~/git/dotfiles
$ cd ~/git/dotfiles
$ ./install.sh          # stow all packages + refresh caches (default)
```

Options:

```
./install.sh --list             list packages and optional tools
./install.sh --packages bash,vim  stow only these packages
./install.sh --tools            install the optional CLI tool belt (dnf)
./install.sh --secrets          create ~/.bashrc.d/secrets.vars from the example
./install.sh --flatpak          add the Flathub remotes
./install.sh --all              everything above
./install.sh --dry-run          show what would be done
```

- Every directory in this repo is a stow package; new ones are picked up automatically — no list to maintain
- Safe to re-run at any time (`--restow` is idempotent); missing requirements are installed via dnf on Fedora or reported on other distros
- Prefer manual stow? `stow -t ~ --restow */` is all the script does
- The `stow -t DIR` sets the target directory to `DIR` instead of the parent of the stow directory, i.e `~` is the home directory.

- You also have the option to install only the dotfile you want, like so:
```
# cd ~/git/dotfiles
# stow -t ~ vim
```

- After adding new package files (e.g. a new `bash/.inputrc`), just re-run `./install.sh`.

- Don't want to use Stow? Symlink it manually.

### Post-install steps

1. **Local secrets** — the bash package expects `~/.bashrc.d/secrets.vars` (gitignored,
   never committed) for API keys, tokens and machine-specific environment:

```
$ cp bash/.bashrc.d/secrets.vars.example ~/.bashrc.d/secrets.vars  # then edit
$ chmod 600 ~/.bashrc.d/secrets.vars
```

2. **Fonts** — fonts live in `~/.local/share/fonts` (XDG standard, declared in
   `fontconfig/.config/fontconfig/fonts.conf`). Copy your fonts there and refresh:

```
$ mkdir -p ~/.local/share/fonts
$ fc-cache -f
```

3. **Start a new shell** so `~/.bashrc` and `~/.inputrc` are picked up (or reload
   manually with `bind -f ~/.inputrc` and `src`).

### bash configuration layout

```
~/.bashrc.d/bash_aliases        # general aliases (+ .fedora / .ubuntu variants)
~/.bashrc.d/bash_functions      # helper functions
~/.bashrc.d/bash_path           # PATH / MANPATH / INFOPATH (single source of truth)
~/.bashrc.d/bash_prompts        # PROMPT_COMMAND, git prompt, terminal title
~/.bashrc.d/secrets.vars        # local secrets (gitignored)
~/.inputrc                      # readline: completion + history key bindings
~/.config/environment.d/        # systemd user session variables (Wayland/GDM)
```

### Flatpak

- Flathub stable and beta:

```
$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
$ flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
```
