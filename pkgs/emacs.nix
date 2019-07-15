{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs26;

    extraPackages = epkgs: with epkgs; [
      ace-jump-mode
      ace-window
      ag
      company
      clojure-mode
      clj-refactor
      dockerfile-mode
      evil
      general
      helm-projectile
      helm-swoop
      magit
      pipenv
      projectile
      rainbow-delimiters
      rbenv
      rspec-mode
      undo-tree
      use-package
      which-key
    ];
  };


  home.file.".emacs.d" = {
    source = ../pre-migration/emacs/emacs.d;
    recursive = true;
  };
}
