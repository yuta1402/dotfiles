#! /bin/bash

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gvimrc ~/.gvimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

if [ -e ~/.vim ]; then
	echo ".vim: Directory exists"
else
	ln -s ~/dotfiles/.vim ~/.vim
fi
