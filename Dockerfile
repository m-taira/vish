FROM ubuntu:18.04
ENV LANG="ja_JP.UTF8"\
    LC_NUMERIC="ja_JP.UTF8"\
    LC_TIME="ja_JP.UTF8"\
    LC_MONETARY="ja_JP.UTF8"\
    LC_PAPER="ja_JP.UTF8"\
    LC_MEASUREMENT="ja_JP.UTF8"\
    TERM=xterm-256color
RUN apt-get update
RUN apt-get install -y vim fish git curl locales sudo
RUN locale-gen ja_JP.UTF-8

# install docker
RUN apt-get install -y apt-transport-https ca-certificates 
RUN apt-get install -y software-properties-common
RUN fish -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key  add -"
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable test edge"
RUN apt-get update
RUN apt-get install -y docker-ce
RUN adduser --disabled-password taira
RUN groupmod -g 968 docker
RUN usermod -aG docker taira
#RUN git clone https://github.com/powerline/fonts 
#RUN fonts/install.sh

RUN curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

USER taira
RUN curl -o ~/.config/fish/functions/fisher.fish --create-dirs -LO https://git.io/fisher
RUN fish -c "fisher add oh-my-fish/theme-bobthefish"

#RUN mkdir -p ~/.vim/colors
#RUN git clone https://github.com/tomasr/molokai ~/.vim/colors/molokai
#RUN ~/.vim/colors/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim

RUN mkdir -p ~/.vim/pack/plugins/start

# ツリーのファイルビューワー
RUN git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/plugins/start/nerdtree

# インデント
RUN git clone https://github.com/nathanaelkane/vim-indent-guides ~/.vim/pack/plugins/start/vim-indent-guides

# カラースキーマ
RUN git clone https://github.com/guns/xterm-color-table.vim ~/.vim/pack/plugins/start/xterm-color-table

# vue
RUN git clone https://github.com/posva/vim-vue ~/.vim/pack/plugins/start/vim-vue

# Git(:Gdiff :Gstatusなどの追加)
RUN git clone https://github.com/tpope/vim-fugitive ~/.vim/pack/plugins/start/vim-fugitive

# Gitの差分がある行を行数の左に表示する
RUN git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/plugins/start/vim-gitgutter.git

# RubyのEndを自動で追加する
RUN git clone https://github.com/tpope/vim-endwise ~/.vim/pack/plugins/start/vim-endwise

# vimのステータスラインを豪華にする
RUN git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline
RUN git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/plugins/start/vim-airline-themes

# FZFを使ってインタプリタ検索
RUN git clone https://github.com/junegunn/fzf.vim.git ~/.vim/pack/plugins/start/fzf.vim

# 対応する【】を自動で追加する
RUN git clone https://github.com/cohama/lexima.vim ~/.vim/pack/plugins/start/lexima.vim

# molokai カラースキーマ
RUN git clone https://github.com/tomasr/molokai ~/.vim/pack/plugins/start/molokai

# vim外部で変更があったファイルを自動読み込み(:eが必要)
RUN git clone https://github.com/djoshea/vim-autoread ~/.vim/pack/plugins/start/vim-autoread

# typescript
RUN git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/plugins/start/typescript-vim

ADD --chown=taira:taira .vimrc /home/taira/.vimrc
ADD --chown=root:root .vimrc /root
CMD fish
