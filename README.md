### dotfiles collection

This is my dotfiles collection, a set of configuration files I use to customize different tools.

### Installation

- Use [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles.
- Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place

```
# mkdir ~/git
# git clone https://github.com/tiagomdrizzo/dotfiles
# cd ~/git/dotfiles
# stow *
```

- You also have the option to install only the dotfile you want, like so:
```
# cd ~/git/dotfiles
# stow vim
```

- Don't want to use Stow? Symlink it manually.

### Credits

Most dotfiles were heavily based on [Antonio Dias](https://github.com/accdias) work.