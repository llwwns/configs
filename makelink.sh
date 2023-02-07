#!/bin/bash
makelink() {
  if [ -f "$HOME/$1" ] ; then
    mv "$HOME/$1" "$HOME/$1_old"
  elif [ -L "$HOME/$1" ] ; then
    rm "$HOME/$1"
  elif [ -d "$HOME/$1" ] ; then
    mv "$HOME/$1" "$HOME/$1_old"
  fi
  ln -s "$(pwd)/$2" "$HOME/$1"
}
mkdir -p "$HOME/.config/"
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/.config/tig"
makelink .inputrc   .inputrc
# makelink .tern-config .tern-config
# makelink .ycm_extra_conf.py .ycm_extra_conf.py
# makelink .xmonad .xmonad
makelink .config/tig/.tigrc .tigrc
makelink .config/tmux.conf tmux.conf
makelink .config/fish/config.fish fish/config.fish
makelink .config/fish/fishfile fish/fishfile
makelink .config/rofi rofi
makelink .config/hypr hypr
makelink .config/alacritty alacritty
makelink .config/nvim nvim
makelink .config/topgrade.toml topgrade.toml
makelink .config/starship.toml starship.toml
