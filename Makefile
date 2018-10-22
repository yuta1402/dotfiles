DOTPATH     := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES  := $(wildcard .??*) bin
EXCLUSIONS  := .DS_Store .git .gitmodules
DOTFILES    := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all: install

list:
	@$(foreach file, $(DOTFILES), ls -dF $(file);)

link:
	@$(foreach file, $(DOTFILES), ln -snfv $(DOTPATH)/$(file) $(HOME)/$(file);)
	# nvim
	ln -snfv ${DotDirectory}/.vim ${HOME}/.config/nvim

unlink:
	@$(foreach file, $(DOTFILES), rm -rfv $(HOME)/$(file);)

update:
	git pull origin master

install: link

clean: unlink

.PHONY: list link unlink update install clean
