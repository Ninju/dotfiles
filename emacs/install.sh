#!/usr/bin/env sh

echo "1. Move emacs.d to ~/.emacs.d"
echo
printf "\t $ %s\n" "$(echo ln -s "$PWD/emacs.d" ~/.emacs.d)"

echo

echo "2. Ignore emacs.personal"
echo
printf "\t $ rm -rf emacs.personal\n"

echo
echo "Done"
