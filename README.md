# Dotfiles

## Introduction

This is a list of simple software downloads and configurations for 
setting up a new build on WSL2 Debian with a functional environment.

## Packages
sudo apt-get update && sudo apt-get install -y \
  vim-gtk \
  git \
  gpg \
  pass \
  curl \
  rsync \
  unzip \
  htop \
  ripgrep \

# Rust Package
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Clone down this dotfiles repo to the home directory.
git clone https://github.com/bbullman/dotfiles ~/dotfiles

# Create symlinks to various dotfiles.
# NOTE: The last one is WSL 1 / 2 specific. No need to do this on native Linux.
  ln -s ~/dotfiles/.bashrc ~/.bashrc \
  && ln -s ~/dotfiles/.gitconfig ~/.gitconfig \
  && ln -s ~/dotfiles/.profile ~/.profile \
  && ln -s ~/dotfiles/.vimrc ~/.vimrc \

# Create your own personal ~/.gitconfig.user file. After copying the file,
# you should edit it to have your name and email address so git can use it.
cp ~/dotfiles/.gitconfig.user ~/.gitconfig.user

# Listing
  .bashrc
  .gitconfig
  .profile
  .vimrc
