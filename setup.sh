#!/bin/bash

#sudo apt-get update && sudo apt-get upgrade -y
#sudo apt-get install -y vim git zsh curl
#sudo apt-get install -y clang make
#sudo apt-get install -y libbsd-dev
#sudo apt remove unattended-upgrades
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# SETUP VIM - NERDTREE
if [ -d "~/.vim/pack/vendor/start/nerdtree" ]
then
    echo "$blue NERDTree Installed !! $reset"
else
    git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
    vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
fi

# SETUP AUTOLOAD
cp -r src/autoload ~/.vim

# SETUP VIMRC
cat ~/.vimrc > ~/.vimrc.bak
cp src/.vimrc ~/.vimrc

vim -c 'PlugUpgrade | PlugInstall | qa'
patch -i src/monokai.diff ~/.vim/plugged/vim-monokai/colors/monokai.vim

echo "$green SETUP COMPLETED $reset"
