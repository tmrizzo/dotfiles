## dotfiles collection

This is my dotfiles collection, a set of configuration files I use to customize different tools.

### Packages

Managed packages: `bash`, `zsh`, `vim`, `tmux`, `git`, `terminator`, `fontconfig`, `gtk`.

```
# dnf install codium vim stow tmux gnome-tweaks toolbox podman podman-compose pavucontrol
```

Optional tools used by the bash configuration (features activate automatically when the
tool is present):

```
# dnf install fzf zoxide bat fd-find ripgrep yt-dlp
```

### Installation

- Use [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles.
- Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place

```
$ dnf install -y stow vim tmux
$ mkdir ~/git
$ git clone https://github.com/tmrizzo/dotfiles
$ cd ~/git/dotfiles
$ stow -t ~ bash git tmux vim fontconfig gtk terminator zsh
```

- The `stow -t DIR` sets the target directory to `DIR` instead of the parent of the stow directory, i.e `~` is the home directory.

- You also have the option to install only the dotfile you want, like so:
```
# cd ~/git/dotfiles
# stow -t ~ vim
```

- After adding new package files (e.g. a new `bash/.inputrc`), re-run stow to pick them up:
```
# stow -t ~ --restow bash
```

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
