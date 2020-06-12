FROM ubuntu:18.04
ENV LANG="ja_JP.UTF8"\
    LC_NUMERIC="ja_JP.UTF8"\
    LC_TIME="ja_JP.UTF8"\
    LC_MONETARY="ja_JP.UTF8"\
    LC_PAPER="ja_JP.UTF8"\
    LC_MEASUREMENT="ja_JP.UTF8"\
    TERM=xterm-256color
RUN apt-get update
RUN apt-get install -y vim fish git curl locales
RUN locale-gen ja_JP.UTF-8
RUN adduser --disabled-password taira
RUN git clone https://github.com/powerline/fonts 
RUN fonts/install.sh

USER taira
RUN curl -o ~/.config/fish/functions/fisher.fish --create-dirs -LO https://git.io/fisher
RUN fish -c "fisher add oh-my-fish/theme-bobthefish"

#RUN mkdir -p ~/.vim/colors
#RUN git clone https://github.com/tomasr/molokai ~/.vim/colors/molokai
#RUN ~/.vim/colors/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim

RUN mkdir -p ~/.vim/pack/plugins/start
RUN git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/plugins/start/nerdtree
RUN git clone https://github.com/nathanaelkane/vim-indent-guides ~/.vim/pack/plugins/start/vim-indent-guides
RUN git clone https://github.com/guns/xterm-color-table.vim ~/.vim/pack/plugins/start/xterm-color-table
RUN git clone https://github.com/posva/vim-vue ~/.vim/pack/plugins/start/vim-vue
RUN git clone https://github.com/tpope/vim-fugitive ~/.vim/pack/plugins/start/vim-fugitive
RUN git clone https://github.com/tpope/vim-endwise ~/.vim/pack/plugins/start/vim-endwise
RUN git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline
RUN git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/plugins/start/vim-airline-themes

ADD --chown=taira:taira .vimrc /home/taira/.vimrc

CMD fish
