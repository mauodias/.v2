#!/bin/bash

echo
echo - Linking general dotfiles
echo

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
echo - Linking NVIM config files
echo

NVIMFOLDER=~/.config/nvim
NVIMINIT=~/.config/nvim/vim.init

if [ -e $NVIMFOLDER ]; then
  ln -s $NVIMFOLDER ~/.vim
  echo Linked $NVIMFOLDER to ~/.vim
else
  echo NVIM config \($NVIMFOLDER\) folder not found
fi

if [ -e $NVIMINIT ]; then
  ln -s $NVIMINIT ~/.vimrc
  echo Linked $NVIMINIT to ~/.vimrc
else
  echo NVIM init file \($NVIMINIT\) not found
fi


echo
echo - Finished linking dotfiles
echo
