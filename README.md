### dotfiles collection

This is my dotfiles collection, a set of configuration files I use to customize tools used in a daily basis.

### How do I use these files?

```sh
mkdir ~/git
cd ~/git
git clone https://github.com/tiagomdrizzo/dotfiles
ln -v -sf ~/git/dotfiles/bash_profile ~/.bash_profile
ln -v -sf ~/git/dotfiles/bashrc ~/.bashrc
ln -v -sf ~/git/dotfiles/bashrc.d ~/.bashrc.d
ln -v -sf ~/git/dotfiles/gitconfig ~/.gitconfig
ln -v -sf ~/git/dotfiles/vimrc ~/.vimrc
ln -v -sf ~/git/dotfiles/vim ~/.vim
ln -v -sf ~/git/dotfiles/tmux.conf ~/.tmux.conf
```

### Credits

These dotfiles are heavily based on Antonio Dias work at https://github.com/accdias
