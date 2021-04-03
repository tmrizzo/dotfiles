## dotfiles collection

This is my dotfiles collection, a set of configuration files I use to customize different tools.

### Installation

- Use [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles.
- Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place

```
$ dnf install -y stow pcre-tools vim tmux
$ mkdir ~/git
$ git clone https://github.com/tiagomdrizzo/dotfiles
$ cd ~/git/dotfiles
$ stow -t ~ *
```

- The `stow -t DIR` sets the target directory to `DIR` instead of the parent of the stow directory, i.e `~` is the home directory.

- You also have the option to install only the dotfile you want, like so:
```
# cd ~/git/dotfiles
# stow -t ~ vim
```

- Don't want to use Stow? Symlink it manually.

### Flatpak

- Flathub stable and beta:

```
$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
$ flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
```
