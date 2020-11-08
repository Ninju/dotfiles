{ config ? null, pkgs ? (import <nixpkgs> {}), rofi ? pkgs.rofi, ... }:

let
  # u-tool = import uswitch/u.nix pkgs;
in
{
# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # home.file.".lein/profiles.clj".source = ~/dotfiles/lein/profiles.clj;
  # home.file.".config/rofi/config".source = ./dotfiles/config/rofi/config;

  home.packages = with pkgs; [
    ag
    awscli
    bat
    cabal-install
    csvkit
    escrotum
    emacs
    clojure
    docker
    google-chrome
    pgcli
    mycli
    feh
    maim
    jq
    openjdk8
    leiningen
    httpie
    pandoc
    pavucontrol
    patchelf
    binutils-unwrapped
    python37Packages.libxml2 # xmllint
    python37Packages.grip # for grip-mode live markdown previews in Emacs
    python3Full
    python37Packages.pip
    qutebrowser
    mplayer
    dolphin
    ranger
    git
    fzf
    kubernetes
    kustomize
    usbutils
    openvpn
    slack
    stack
    # u-tool
    xclip
    # firefox-bin
    telnet
    tree
    # tcpdump
  ];

#   imports = [
#     ./imports/autorandr.nix
#     ./imports/neovim.nix
#     ./imports/bash.nix
#     ./imports/session-variables.nix
#     ./imports/emacs.nix
#     ./imports/keyboard.nix
#     ./imports/git.nix
#     ./imports/ssh.nix
#     ./imports/termite.nix
#     # ./imports/firefox.nix
#     ./imports/i3.nix
#   ];
}
