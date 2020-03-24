{ config ? null, pkgs ? (import <nixpkgs> {}), rofi ? pkgs.rofi, ... }:

# DONT RUN THIS IT BREAKS YOUR SYSTEM ASKJDSAIDU(!*@#(*!&@#)(!@#!@#

I forgot what stops working, but it's something important...

let
  u-tool = import uswitch/u.nix pkgs;
in
{
# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.file.".lein/profiles.clj".source = ./dotfiles/lein/profiles.clj;
  home.file.".config/rofi/config".source = ./dotfiles/config/rofi/config;

  home.packages = with pkgs; [
    ag
    awscli
    bat
    cabal-install
    csvkit
    dbeaver
    escrotum
    ghc
    clojure
    docker
    google-cloud-sdk
    google-chrome
    pgcli
    mycli
    feh
    nodejs-10_x
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
    usbutils
    openvpn
    # slack
    stack
    u-tool
    xclip
    firefox-bin
    telnet
    tree
    # tcpdump
  ];

  imports = [
    ./imports/autorandr.nix
    ./imports/neovim.nix
    ./imports/bash.nix
    ./imports/session-variables.nix
    ./imports/emacs.nix
    ./imports/keyboard.nix
    ./imports/git.nix
    ./imports/ssh.nix
    ./imports/termite.nix
    # ./imports/firefox.nix
    ./imports/i3.nix
  ];
}
