git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen" --depth=1
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/yyuu/pyenv.git ~/.pyenv --depth=1
git config --global core.editor nvim
git config --global gui.encoding utf-8
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.vimdiff.cmd "nvim -d \$BASE \$LOCAL \$REMOTE \$MERGED -c '\$wincmd w' -c 'wincmd J'"
git config --global difftool.prompt false
git config --global mergetool.keepBackup false
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.fh fetch
git config --global alias.mg merge
git config --global alias.ck checkout
git config --global oh-my-zsh.hide-dirty 1
git config --global core.mergeoptions --no-edit
mkdir -p ~/.config/nvim/
echo "source ~/.vimrc" > ~/.config/nvim/init.vim
wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz
gzip -d SKK-JISYO.L.gz
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
