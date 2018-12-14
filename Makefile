.PHONY: install
install:
	cat homebrew_packages | xargs /usr/local/bin/brew install

sync:
	@git add -N .
	@git add -p
	@git commit -v
	@git pull --rebase
	@git push -v

update:
	@-git diff-index --quiet HEAD -- ||:
	@if [[ $rc != 0 ]]; then \
		echo "Unstaged changes. Run 'make sync' first"; \
	else \
		git pull --rebase; \
	fi
