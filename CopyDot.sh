#!/bin/sh

# This script is here to copy out what your current environment looks like

# Copies out the main dotfiles
# Use this if you don't have them symlinked
# cp ~/.profile ~/dotfiles/.profile
# cp ~/.vimrc ~/dotfiles/.vimrc
# cp ~/.gitconfig ~/dotfiles/.gitconfig
# cp ~/.bashrc ~/dotfiles/.bashrc

# Copy out all vim plugins
# cp -R ~/.vim ~/dotfiles/ 

# Copy out all the configs
cp -R ~/.config ~/dotfiles/

# Remove unnecessary plugins
# WARNING: Update this as needed!
# rm -rf ~/dotfiles/.vim/pack/ctags
# rm -rf ~/dotfiles/.vim/pack/plugins/start/vimproc.vim

# Copy out scripts directory
cp -R ~/scripts ~/dotfiles/
