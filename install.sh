#!/bin/sh

rm -f ~/.bashrc
ln -s ~/.dotfile/dotbashrc/bashrc ~/.bashrc

rm -fr ~/.vimrc ~/.vim
ln -s ~/.dotfile/dotvim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

rm -f ~/.gitconfig
ln -s ~/.dotfile/dotgitconfig/gitconfig ~/.gitconfig
rm -f ~/.gitignore
ln -s ~/.dotfile/dotgitconfig/gitignore ~/.gitignore

rm -f ~/.tmux.conf
mkdir -p dottmux/plugin
ln -s ~/.dotfile/dottmux/tmux.conf ~/.tmux.conf

