let

  pkgs = import <nixpkgs> {};
  emacs = pkgs.emacs27;

  dotfiles = pkgs.fetchFromGithub {
    "owner" = "ninju";
    "repo" = "dotfiles";
    "rev" = "121c49c4b371a288759359c9363fb8b256bfbe57";
    "sha256" = "EM2dpDeDCn4NQna5WdA38d2P4ZwWEUGXOlF9isaZHkI=";
  };

in { emacs = emacs; }
