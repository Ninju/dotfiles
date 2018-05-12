#!/usr/bin/env bash

git clone -b develop git@github.com:syl20bnr/spacemacs.git "$SPACEMACS_DIR"
ln -s "$SPACEMACS_DIR" ~/.emacs.d

exit 0
