#!/bin/bash

count=`ls -1 *.symlink 2>/dev/null | wc -l`
if [ $count != 0 ]; then
  for i in *.symlink; do
    file=.$(basename $i .symlink)
    if [ ! -e ~/$file ]; then
      ln -s $PWD/$i ~/$file
      echo Linked $PWD/$i to ~/$file
    else
      echo $file exists in $HOME
    fi
  done
fi

echo
echo - Finished linking dotfiles
echo
