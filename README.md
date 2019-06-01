### dotfiles collection

This is my dotfiles collection, a set of configuration files I use to customize different tools.

### Installation

- Use [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles.
- Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place

```
# mkdir ~/git
# git clone https://github.com/tiagomdrizzo/dotfiles
# cd ~/git/dotfiles
# stow -t ~ *
```

- The `stow -t DIR` sets the target directory to `DIR` instead of the parent of the stow directory, i.e `~` is the home directory.

- You also have the option to install only the dotfile you want, like so:
```
# cd ~/git/dotfiles
# stow -t ~ vim
```

- Don't want to use Stow? Symlink it manually.

# i3wm configuration

The whole i3wm config file has comments, commands, examples, and so on to help new people (and myself) to remember what goes where.

Note: This configuration has some i3wm + KDE preparations.

- Tested with:
```
i3status-2.12-1.fc28.x86_64
i3-ipc-0.1.4-12.fc28.noarch
i3lock-2.9.1-2.fc28.x86_64
i3-4.15-1.fc28.x86_64
py3status-3.12-1.fc28.noarch
dunst-1.2.0-2.fc28.x86_64
rofi-1.5.1-1.fc28.x86_64
```

- Copr Repositories:
```
# dnf copr enable -y yaroslav/i3desktop
# dnf copr enable -y vladius/polybar
```

- Base Packages:
```
# dnf install i3 i3lock i3-ipc i3status py3status feh compton rofi tlp light pcre-tools network-manager-applet terminator \
  light vlc ImageMagick dunst numlockx polybar
```

- Stow it:
```
# stow -t ~ dunst compton polybar Xresources scripts rofi
```

# Sway configuration

- Copr Repository:
```
# dnf copr enable gumieri/sway
```

- Base Packages:
```
# dnf install mako sway swaylock waybar playerctl jq langpacks-pt_BR libsigc++ pavucontrol python2-devel sway-debugsource xdotool \
feh compton rofi tlp light pcre-tools network-manager-applet terminator light vlc ImageMagick dunst numlockx polybar
```
