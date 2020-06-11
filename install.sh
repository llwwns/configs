#! /bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git config --global core.editor nvim
git config --global gui.encoding utf-8
git config --global diff.tool meld
git config --global merge.tool meld
git config --global merge.conflictstyle diff3
git config --global difftool.prompt false
git config --global mergetool.keepBackup false
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.fh fetch
git config --global alias.mg merge
git config --global alias.re restore
git config --global alias.sw switch
git config --global oh-my-zsh.hide-dirty 1
git config --global core.mergeoptions --no-edit
git config --global stash.showPatch true
git config --global pull.ff only
mkdir -p ~/.config/nvim/
echo "source ~/.vimrc" > ~/.config/nvim/init.vim
wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz
gzip -d SKK-JISYO.L.gz
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install ripgrep --force --features pcre2
cargo install fd-find
cargo install cargo-edit
cargo install cargo-cache
cargo install cargo-update
cargo install chit
cargo install procs
cargo install zoxide
cargo install lsd
cargo install-update-config ripgrep -f pcre2
