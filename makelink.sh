#!/bin/bash
makelink() {
  if [ -f "$HOME/$1" ] ; then
    mv "$HOME/$1" "$HOME/$1_old"
  elif [ -L "$HOME/$1" ] ; then
    rm "$HOME/$1"
  fi
  ln -s "$(pwd)/$2" "$HOME/$1"
}
makelink .tigrc     .tigrc
makelink .tmux.conf .tmux.conf
makelink .vimrc     .vimrc
makelink .zshrc     .zshrc
makelink .inputrc   .inputrc
makelink .zpreztorc .zpreztorc
makelink .zprofile  .zprofile
makelink .tern-config .tern-config
makelink .ycm_extra_conf.py .ycm_extra_conf.py
makelink .xmonad .xmonad
mkdir -p "$HOME/.config/"
makelink .config/fish fish
makelink .config/rofi rofi
makelink .config/alacritty alacritty
makelink .config/oni oni
#makelink .oh-my-zsh/custom/mh_m.zsh-theme mh_m.zsh-theme
