#! /bin/bash

DotFiles=(.vimrc .gvimrc .bashrc .bash_profile .vim)

for file in ${DotFiles[@]}
do
	ln -snfv ~/dotfiles/$file ~/$file
done

git submodule update --init
