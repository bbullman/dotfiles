#!/bin/sh

# This script is here to copy out what your current environment looks like

# Copies out the main dotfiles
# Use this if you don't have them symlinked
# cp ~/.profile ~/dotfiles/.profile
# cp ~/.vimrc ~/dotfiles/.vimrc
# cp ~/.gitconfig ~/dotfiles/.gitconfig
# cp ~/.bashrc ~/dotfiles/.bashrc

# Copy out all vim plugins
cp -R ~/.vim ~/dotfiles/ 

# Remove unnecessary plugins
# WARNING: Update this as needed!
rm -rf ~/dotfiles/.vim/pack/ctags
rm -rf ~/dotfiles/.vim/pack/plugins/start/vimproc.vim

# Remove plugins .git files
# WARNING: Update this as needed!
# TODO: Perhaps make this a mv to .bak instead
# The purpose of this is to keep git from thinking these are submodules when they are in fact just plugin snapshots
rm -rf ~/dotfiles/.vim/pack/plugins/start/ale/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/dispatch/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/gruvbox/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/lightline/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/nerdtree/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/omnisharp-vim/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/rust.vim/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/sharpenup/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/syntastic/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/tagbar/.git*
rm -rf ~/dotfiles/.vim/pack/plugins/start/asyncomplete.vim/.git*
