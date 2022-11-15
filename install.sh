#! /bin/bash
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [[ ! -f ~/.config/git/config ]]; then
  mkdir -p ~/.config/git
fi
git config --global core.editor nvim
git config --global core.mergeoptions --no-edit
git config --global pager.diff delta
git config --global pager.log delta
git config --global pager.reflog delta
git config --global pager.show delta

git config --global delta.navigate true
git config --global delta.navigate true
git config --global delta.features "side-by-side line-numbers decorations"
git config --global delta.plus-style 'syntax "#283B4D"'
git config --global delta.minus-style 'syntax "#3F2D3D"'

git config --global delta.decorations.commit-decoration-style "bold yellow box ul"
git config --global delta.decorations.file-style "bold yellow ul"
git config --global delta.decorations.file-decoration-style none
git config --global delta.decorations.hunk-header-decoration-style "cyan box ul"

git config --global delta.line-numbers.line-numbers-left-style "cyan"
git config --global delta.line-numbers.line-numbers-right-style "cyan"
git config --global delta.line-numbers.line-numbers-minus-style 124
git config --global delta.line-numbers.line-numbers-plus-style 28

git config --global gui.encoding utf-8

git config --global diff.tool meld
git config --global diff.algorithm patience
git config --global diff.indentHeuristic true

git config --global merge.tool vim_mergetool
git config --global merge.guitool meld
git config --global merge.conflictStyle diff3

git config --global mergetool.vim_mergetool.cmd "nvim -f -c \"MergetoolStart\" \"\$MERGED\" \"\$BASE\" \"\$LOCAL\" \"\$REMOTE\""
git config --global mergetool.keepBackup false
git config --global mergetool.writeToTemp true

git config --global difftool.prompt false

git config --global alias.st status
git config --global alias.cm commit
git config --global alias.fh fetch
git config --global alias.mg merge
git config --global alias.sw switch
git config --global alias.re restore
git config --global alias.gh "log --oneline --graph"

git config --global oh-my-zsh.hide-dirty 1

git config --global pull.ff only

git config --global stash.showPatch true

git config --global init.defaultBranch true

git config --global credential.helper store

git config --global rebase.autosquash true
git config --global rebase.autostash true

# mkdir -p ~/.config/nvim/
# echo "source ~/.vimrc" > ~/.config/nvim/init.vim
wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz
gzip -d SKK-JISYO.L.gz
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# cargo install ripgrep --force --features pcre2
# cargo install fd-find
# cargo install cargo-edit
# cargo install cargo-cache
# cargo install cargo-update
# cargo install chit
# cargo install procs
# cargo install zoxide
# cargo install lsd
# cargo install-update-config ripgrep -f pcre2
