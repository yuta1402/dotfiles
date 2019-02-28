DOTPATH           := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES        := $(wildcard .??*) bin
EXCLUSIONS        := .DS_Store .git .gitignore .gitmodules .config
DOTFILES          := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
CONFIG_CANDIDATES := $(wildcard .config/??*)
CONFIG_DIRS       := $(filter-out $(EXCLUSIONS), $(CONFIG_CANDIDATES))

all: install

list:
	@$(foreach file, $(DOTFILES), ls -dF $(file);)
	@$(foreach file, $(CONFIG_DIRS), ls -dF $(file);)

link:
	# dotfiles
	@$(foreach file, $(DOTFILES), ln -snfv $(DOTPATH)/$(file) $(HOME)/$(file);)
	# .config directory
	mkdir -p $(HOME)/.config
	@$(foreach file, $(CONFIG_DIRS), ln -snfv $(DOTPATH)/$(file) $(HOME)/$(file);)
	# nvim
	ln -snfv $(DOTPATH)/.vim $(HOME)/.config/nvim

unlink:
	@$(foreach file, $(DOTFILES), rm -rfv $(HOME)/$(file);)

update:
	git pull origin master

install: link

clean: unlink

.PHONY: list link unlink update install clean
