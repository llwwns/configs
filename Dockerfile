From archlinux/base
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN pacman -Syu --noconfirm && pacman -S --noconfirm npm neovim python python-neovim fish wget curl tmux tig fd ripgrep git nodejs rustup cmake ninja base-devel && rm -rf /var/cache/pacman/pkg
RUN rustup install stable  && rustup default stable && rustup component add rust-src && rustup toolchain add nightly && cargo +nightly install racer
ADD . /root/configs
WORKDIR /root/configs
RUN ./install.sh
RUN ./makelink.sh
RUN fish -l -c "source ./fish/setup.fish"
RUN fish -l -c fisher
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/fzf/bin
RUN nvim --headless +PlugInstall +qa
WORKDIR /root/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/racerd/
RUN git fetch && git checkout master && rm Cargo.lock
WORKDIR /root/.vim/plugged/YouCompleteMe/third_party/ycmd/
RUN perl -i -pe "s/cargo, 'build'/cargo, '+nightly', 'build'/g" build.py
WORKDIR /root/.vim/plugged/YouCompleteMe
RUN ./install.py --rust-completer --js-completer --clang-completer --ninja
WORKDIR /root
