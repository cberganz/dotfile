#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y git \
                        build-essential \
                        zsh \
                        tree \
                        curl \
                        terminator \
                        clang \
                        make \
                        cmake \
                        pkg-config \
                        libfreetype6-dev \
                        libfontconfig1-dev \
                        libxcb-xfixes0-dev \
                        libxkbcommon-dev \
                        python3

sudo apt remove unattended-upgrades

# Install OhMyZsh!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Rust compiler
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup override set stable
rustup update stable

# Intall Alacritty
git clone https://github.com/alacritty/alacritty.git && cd alacritty
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/local/bin/alacritty

# Worspace handling on multiple screens
gsettings set org.gnome.mutter workspaces-only-on-primary false

# Install nvim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm nvim-linux64.deb
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.config/nvim/after/packer.nvim
echo "------"
echo "TO DO: Enter :PackerUpdate then close nvim when installation done"
echo "------"
sleep 10
nvim

# SETUP AUTOLOAD
cp -r src/autoload ~/.vim

# SETUP VIMRC
cat ~/.vimrc > ~/.vimrc.bak
cp src/.vimrc ~/.vimrc

vim -c 'PlugUpgrade | PlugInstall | qa'

echo "SETUP COMPLETED"
