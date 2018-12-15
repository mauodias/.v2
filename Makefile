install_packages:
	@cat homebrew_packages | xargs /usr/local/bin/brew install

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

link:
	@for i in *.symlink; do \
	  if [ ! -e ~/.$(basename $i .symlink) ]; then
	    ln -s $PWD/$i ~/.$(basename $i .symlink) \
	    echo Linked $PWD/$i to ~/.$(basename $i .symlink) \
	  else \
	    echo .$(basename $u .symlink) exists in $HOME \
	  fi \
	done
	@echo Finished linking dotfiles


.PHONY: install
install: install_packages update link
