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
WORKDIR /root
