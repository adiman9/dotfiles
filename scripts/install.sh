#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
vim -c VundleUpdate -c quitall
./zsh-install.sh
