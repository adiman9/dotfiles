#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.9/install.sh | bash
vim -c VundleUpdate -c quitall
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install zsh
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  pkg install zsh
fi
~/scripts/zsh-install.sh
