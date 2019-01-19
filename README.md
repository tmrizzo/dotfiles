### dotfiles collection

This is my dotfiles collection, a set of configuration files I use to customize different tools.

### Installation

- Use [GNU Stow](https://www.gnu.org/software/stow/) to install.
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

### Credits
These dotfiles are heavily based on Antonio Dias work at https://github.com/accdias