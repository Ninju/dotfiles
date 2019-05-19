#!/usr/bin/env bash

git config --global --replace-all alias.co checkout
git config --global --replace-all alias.br branch
git config --global --replace-all alias.ci commit
git config --global --replace-all alias.st status

git config --global --replace-all alias.gianf "push --force-with-lease"
git config --global --replace-all alias.gong "commit --no-edit --amend"

git config --global --replace-all alias.unstage 'reset HEAD --'

git config --global --replace-all alias.last 'log -1 HEAD'
git config --global --replace-all alias.lg 'log --oneline'
git config --global --replace-all alias.logg 'log --graph'
git config --global --replace-all alias.lgg 'log --oneline --graph'

alias gong="git gong"
alias gianf="git gianf"
alias gut="git status"
alias st="git status"


export PATH="${HOME}/.env/git-aliae/bin:$PATH"
