#!/bin/bash

orange=$'\033[0;33m'
lblue=$'\033[1;34m'
blue=$'\033[34m'
green=$'\033[0;32m'
reset=$'\033[0m'

echo "$blue update repositories $reset"
sudo apt-get update && sudo apt-get upgrade -y

echo "$blue Installing vim git zsh curl $reset"
sudo apt-get install -y vim git zsh curl

echo "$blue Installing clang make $reset"
sudo apt-get install -y clang make

echo "$blue Installing additional man pages $reset"
sudo apt-get install -y libbsd-dev

echo "$orange Remove unattended upgrades"
sudo apt remove unattended-upgrades

echo "$blue installing ohmyzsh $reset"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# SETUP VIM - NERDTREE

if [ [ -d "~/.vim/pack/vendor/start/nerdtree" ] ]
then
    echo "$blue NERDTree Installed !! $reset"
else
    echo "$blue Cloning NERDTree repo $reset"
    git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
    echo "$lblue helptags : NERDTree $reset"
    vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
fi

# SETUP VIMRC

if [ [ -e ~/.vimrc ] ]
then
	echo "$orange Backing up current vimrc config $reset"
	mv ~/.vimrc ~/my_setup/.vimrc.bak
	echo "$orange backed to ~/my_setup $reset"
fi
cp src/.vimrc ~/.vimrc

rm -rf ../dotfile
cd ~

echo "$green SETUP COMPLETED $reset"