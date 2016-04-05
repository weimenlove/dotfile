#!/bin/sh

rm -f ~/.bashrc
ln -s ~/.dotfile/dotbashrc/bashrc ~/.bashrc

rm -fr ~/.vimrc ~/.vim
ln -s ~/.dotfile/dotvim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

rm -f ~/.gitconfig
ln -s ~/.dotfile/dotgitconfig/gitconfig ~/.gitconfig
rm -f ~/.gitignore
ln -s ~/.dotfile/dotgitconfig/gitignore ~/.gitignore

# install snipmate
cd ~/.vim/bundle && \
git clone git://github.com/msanders/snipmate.vim.git

# install syntastic
cd ~/.vim/bundle && \
git clone https://github.com/scrooloose/syntastic

cd ~/.vim/bundle && \
git clone https://github.com/scrooloose/nerdcommenter

cd ~/.vim/bundle && \
git clone https://github.com/Townk/vim-autoclose
