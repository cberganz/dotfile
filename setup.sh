#!/bin/bash

#sudo apt-get update && sudo apt-get upgrade -y
#sudo apt-get install -y vim git zsh curl
#sudo apt-get install -y clang make
#sudo apt-get install -y libbsd-dev
#sudo apt remove unattended-upgrades
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

gsettings set org.gnome.mutter workspaces-only-on-primary false

# SETUP AUTOLOAD
cp -r src/autoload ~/.vim

# SETUP VIMRC
cat ~/.vimrc > ~/.vimrc.bak
cp src/.vimrc ~/.vimrc

vim -c 'PlugUpgrade | PlugInstall | qa'

echo "SETUP COMPLETED"
