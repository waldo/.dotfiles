#!/bin/bash
OLD_DOTFILES_SHA= # self-modified
FILES=~/.dotfiles/refs/*
shopt -s dotglob
CURRENT_SHA=`GIT_DIR=~/.dotfiles/.git git log --format="%H"`

if [ "$OLD_DOTFILES_SHA" != "$CURRENT_SHA" ]
then
  for f in $FILES
  do
    echo "Processing $f file..."
    ln -s $f ~
  done

  sed -i -e '2s/^OLD_DOTFILES_SHA=.*/OLD_DOTFILES_SHA='$CURRENT_SHA' # self-modified/' $0
  clear
fi
