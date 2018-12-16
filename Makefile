install_packages:
	@cat homebrew_packages | xargs /usr/local/bin/brew install

sync:
	@git add -N .
	@git add -p
	@git commit -v
	@git pull --rebase
	@git push -v

update:
	@git pull --rebase;

link:
	@./link.sh

.PHONY: install
install: install_packages update link
