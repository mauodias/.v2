.PHONY: install
install: update pull link

update:
	@brew bundle

push:
	@git add -N .
	@git add -p
	@git commit -v
	@git pull --rebase
	@git push -v

pull:
	@git pull --rebase;

link:
	@./link.sh
