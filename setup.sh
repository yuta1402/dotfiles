#! /bin/bash

DotFiles=(.bashrc .bash_profile .vim)

for file in ${DotFiles[@]}
do
	ln -snfv ~/dotfiles/$file ~/$file
done
