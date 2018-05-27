#!/usr/bin/env bash

# full-stop passes the path to a script containing
# output functions that we can use to hook into the output
#
# e.g. * header()
#      * fail()
#      * success()
#
source "$1"

header "Installing emacs"

if [ -z "$SPACEMACS_DIR" ]; then
  fail "SPACEMACS_DIR must be set"
  exit 1
else
  success "SPACEMACS_DIR is set"
fi

run_without_failing () {
  success_message=$1
  failure_output=$(eval $2 2>&1 1> /dev/null)

  if [ -z "$failure_output" ]; then
    success "$success_message"
  else
    info "$failure_output"
  fi
}

run_without_failing "Cloned spacemacs" \
                    'git clone -b develop git@github.com:syl20bnr/spacemacs.git "$SPACEMACS_DIR"'

run_without_failing "Linked spacemacs to ~/.emacs.d" \
                    'ln -s "$SPACEMACS_DIR" ~/.emacs.d'

exit 0
