DOTPATH           := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES        := $(wildcard .??*)
EXCLUSIONS        := .DS_Store .git .gitignore .gitmodules .github .config
DOTFILES          := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
CONFIG_CANDIDATES := $(wildcard .config/??*)
CONFIG_DIRS       := $(filter-out $(EXCLUSIONS), $(CONFIG_CANDIDATES))
BIN_CANDIDATES    := $(wildcard bin/??*)
BIN_FILES         := $(filter-out $(EXCLUSIONS), $(BIN_CANDIDATES))

all: help

list: ## Show dotfiles
	@$(foreach file, $(DOTFILES), ls -dF $(file);)
	@$(foreach file, $(CONFIG_DIRS), ls -dF $(file);)
	@$(foreach file, $(BIN_FILES), ls -dF $(file);)

init: install link ## Install packages and Create symlink

clean: uninstall unlink ## Uninstall packages and Remove symlink

install: ## Install packages
	./etc/install.sh

uninstall: ## Uninstall packages
	./etc/uninstall.sh

link: ## Create symlink to home directory
	# dotfiles
	@$(foreach file, $(DOTFILES), ln -snfv $(DOTPATH)/$(file) $(HOME)/$(file);)
	# .config directory
	mkdir -p $(HOME)/.config
	@$(foreach file, $(CONFIG_DIRS), ln -snfv $(DOTPATH)/$(file) $(HOME)/$(file);)
	# nvim
	ln -snfv $(DOTPATH)/.vim $(HOME)/.config/nvim
	# bin
	mkdir -p $(HOME)/bin
	@$(foreach file, $(BIN_FILES), ln -snfv $(DOTPATH)/$(file) $(HOME)/$(file);)

unlink: ## Remove symlink from home directory
	@$(foreach file, $(DOTFILES), rm -rfv $(HOME)/$(file);)
	@$(foreach file, $(CONFIG_DIRS), rm -rfv $(HOME)/$(file);)
	@$(foreach file, $(BIN_FILES), rm -rfv $(HOME)/$(file);)
	@rm -rfv $(HOME)/.config/nvim

update: ## Safe update repository
	make unlink
	git push origin master
	git pull --no-rebase origin master
	make link

help: ## Show help
	@echo "Usage:\n    make <command>"
	@echo ""
	@echo "Commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-10s\033[0m %s\n", $$1, $$2}'

.PHONY: list link unlink update install clean help
