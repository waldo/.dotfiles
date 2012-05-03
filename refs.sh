#!/bin/bash
OLD_DOTFILES_SHA=`cat ~/.dotfiles/sha.txt`
FILES=~/.dotfiles/refs/*
shopt -s dotglob
CURRENT_SHA=`GIT_DIR=~/.dotfiles/.git git log -n1 --format="%H"`

if [ "$OLD_DOTFILES_SHA" != "$CURRENT_SHA" ]
then
  for f in $FILES
  do
    echo "Processing $f file..."
    ln -s $f ~
  done

  echo $CURRENT_SHA > ~/.dotfiles/sha.txt
  clear
fi
