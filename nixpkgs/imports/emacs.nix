{ config ? null, pkgs ? (import <nixpkgs> {}), ... }:

{
  # home.file.".emacs.d".recursive = true;
  # home.file.".emacs.d".source = ../pre-migration/emacs/emacs.d;

  programs.emacs = {
    enable = true;
    package = pkgs.emacs26;
  };
}
