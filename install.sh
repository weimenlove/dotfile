#!/bin/sh

rm -f ~/.bashrc
ln -s ~/.dotfile/dotbashrc/bashrc ~/.bashrc
rm -f ~/.vimrc
ln -s ~/.dotfile/dotvim/vimrc ~/.vimrc
rm -f ~/.gitconfig
ln -s ~/.dotfile/dotgitconfig/gitconfig ~/.gitconfig
rm -f ~/.gitignore
ln -s ~/.dotfile/dotgitconfig/gitignore ~/.gitignore
rm -f ~/.spacemacs
ln -s ~/.dotfile/dotspacemacs ~/.spacemacs

git submodule add git@github.com:tpope/vim-pathogen.git dotvim/bundle/vim-pathogen
git submodule add git@github.com:msanders/snipmate.vim.git dotvim/bundle/vim-snipmate

git submodule update --init
git submodule foreach git pull origin master
