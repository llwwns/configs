makelink() {
  if [ -f "$HOME/$1" ]; then
    `mv $HOME/$1 $HOME/$1_old`
  fi
  `ln -s $(pwd)/$2 $HOME/$1`
}
makelink .tigrc     .tigrc
makelink .tmux.conf .tmux.conf
makelink .vimrc     .vimrc
makelink .zshrc     .zshrc
makelink .inputrc   .inputrc
makelink .oh-my-zsh/custom/mh_m.zsh-theme mh_m.zsh-theme
