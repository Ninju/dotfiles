# Dotfiles

## tput: unknown terminal "rxvt-unicode-256color"

```
export TERM=xterm
```


## Do these things

* Install nix package manager
* Install home manager
* Link home-manager config

```
$ ln -s $PWD/nixpkgs $HOME/.config/nixpkgs
```

* Update all the masked values ('***'), e.g. in `nixpkgs/imports/git.nix`.


* Link Doom emacs config

```
$ ln -s $PWD/doom.d $HOME/.doom.d
```
