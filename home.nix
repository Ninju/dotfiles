{ config, pkgs, ... }:

{
  imports = [
    ./pkgs/termite.nix
    ./pkgs/firefox.nix
    ./pkgs/neovim.nix
    ./pkgs/git.nix
    ./pkgs/emacs.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.keyboard = {
    layout = "au";
    options = [
      "ctrl:nocaps"
    ];
  };

  home.sessionVariables = {
    TERMINAL = "termite";
  };
}
