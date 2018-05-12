#!/usr/bin/env bash

if [ -z "$SPACEMACS_DIR" ]; then
  echo >&2 SPACEMACS_DIR must be set
  exit 1
fi

git clone -b develop git@github.com:syl20bnr/spacemacs.git "$SPACEMACS_DIR"
ln -s "$SPACEMACS_DIR" ~/.emacs.d

exit 0
