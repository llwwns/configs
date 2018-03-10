From ubuntu:17.10
RUN sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.riken.go.jp/Linux/ubuntu/%g" /etc/apt/sources.list
RUN sed -i -e "s%http://security.ubuntu.com/ubuntu%http://ftp.riken.go.jp/Linux/ubuntu/%g" /etc/apt/sources.list
RUN apt-get update
RUN apt-get install curl software-properties-common python-dev python-pip\
    python3-dev python3-pip zsh wget tmux tree tig build-essential cmake -y
RUN add-apt-repository ppa:neovim-ppa/stable -y
RUN add-apt-repository ppa:git-core/ppa -y
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install neovim nodejs ghc git -y
RUN apt-get clean
RUN npm install --global yarn
RUN pip3 install neovim
RUN update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
RUN update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
RUN update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
ADD . /root/configs
WORKDIR /root/configs
RUN ./install.sh
RUN ./makelink.sh
RUN vi --headless +PlugInstall +qa
RUN zsh ~/.zshrc
WORKDIR /tmp
RUN wget https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
RUN wget https://github.com/sharkdp/fd/releases/download/v6.3.0/fd-musl_6.3.0_amd64.deb
RUN dpkg -i ripgrep_0.8.1_amd64.deb
RUN rm -rf ripgrep_0.8.1_amd64.deb
RUN dpkg -i fd-musl_6.3.0_amd64.deb
RUN rm -rf fd-musl_6.3.0_amd64.deb
RUN wget https://dl.google.com/go/go1.10.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/fzf/bin:/usr/local/go/bin:/root/go/bin
#WORKDIR /root/.vim/plugged/YouCompleteMe
#RUN ./install.py --go-completer --js-completer --clang-completer
