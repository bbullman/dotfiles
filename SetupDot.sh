#!/bin/sh

# removes the existing files if they exist
rm ~/.bashrc || true
#rm ~/.profile || true
rm ~/.gitconfig || true
rm ~/.vimrc || true
rm -rf ~/.vim || true

# creates symlinks to the new files
ln -s ~/dotfiles/.bashrc ~/.bashrc
#ln -s ~/dotfiles/.profile ~/.profile
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.config ~/.config

cp -R ~/dotfiles/.vim ~/.vim
