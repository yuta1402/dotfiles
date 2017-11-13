#!/bin/bash

DotDirectory="${HOME}/dotfiles"
Excludes=(".git" ".gitignore" ".config")

for f in .??*
do
	if ! $(echo ${Excludes[@]} | grep -q "$f") ; then
		ln -snfv ${DotDirectory}/${f} ${HOME}/${f}
	fi
done

cp -r ${DotDirectory}/.config ${HOME}
cp -r ${DotDirectory}/bin ${HOME}

ln -snfv ${DotDirectory}/.vim ${HOME}/.config/nvim
