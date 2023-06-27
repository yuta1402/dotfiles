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

init: link install ## Create symlinks and Install packages

clean: unlink uninstall ## Remove symlinks and Uninstall packages

install: ## Install packages
	./scripts/install.sh

uninstall: ## Uninstall packages
	./scripts/uninstall.sh

brew/bundle: ## Brew bundle
	brew bundle --no-lock

brew/dump: ## Brew dump
	brew bundle dump --force

link: ## Create symlinks to home directory
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

unlink: ## Remove symlinks from home directory
	@$(foreach file, $(DOTFILES), rm -rfv $(HOME)/$(file);)
	@$(foreach file, $(CONFIG_DIRS), rm -rfv $(HOME)/$(file);)
	@$(foreach file, $(BIN_FILES), rm -rfv $(HOME)/$(file);)
	@rm -rfv $(HOME)/.config/nvim

update: ## Safe update repository
	make unlink
	git pull --no-rebase origin master
	make link

help: ## Show help
	@echo "Usage:\n    make <command>"
	@echo ""
	@echo "Commands:"
	@grep -E '^[a-zA-Z/_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-12s\033[0m %s\n", $$1, $$2}'

.PHONY: all list init clean install uninstall brew/* link unlink update help
