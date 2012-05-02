#!/bin/bash
OLD_DOTFILES_SHA=
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

  sed -i '' -e '2 s/^OLD_DOTFILES_SHA=.*/OLD_DOTFILES_SHA='$CURRENT_SHA'/' $0
  clear
fi
