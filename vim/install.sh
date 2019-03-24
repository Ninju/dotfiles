#!/usr/bin/env sh

echo "1. Move vimrc.symlink to ~/.vimrc"
echo
printf "\t $ %s\n" "$(echo ln -s "$PWD/vimrc.symlink" ~/.vimrc)"

echo
echo "Done"
