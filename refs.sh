#!/bin/bash
FILES=~/.dotfiles/refs/*
shopt -s dotglob

for f in $FILES
do
  echo "Processing $f file..."
  ln -s $f ~
done

clear
