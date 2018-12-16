.PHONY: install
install: update pull link

update:
	@echo
	@echo - Installing/updating Homebrew packages
	@echo
	@brew bundle

push:
	@echo
	@echo - Preparing to push dotfiles updates to GitHub
	@echo
	@git add -N .
	@git add -p
	@git commit -v
	@git pull --rebase
	@git push -v

pull:
	@echo
	@echo - Retrieving dotfiles updates from GitHub
	@echo
	@git pull --rebase;

link:
	@echo
	@echo - Creating symlinks for dotfiles in home directory
	@echo
	@./link.sh
