{ config ? null, pkgs ? (import <nixpkgs> {}), ... }:

let
  # u-tool = import uswitch/u.nix pkgs;
  lorri = import (fetchTarball {
    url = "https://github.com/target/lorri/archive/rolling-release.tar.gz";
  }) { };

  path = with pkgs; lib.makeSearchPath "bin" [ nix gnutar git mercurial ];
in
{
# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "alex";
  home.homeDirectory = "/home/alex";

  home.file.".lein/profiles.clj".source = ./dotfiles/lein/profiles.clj;
  home.file.".config/rofi/config".source = ./dotfiles/config/rofi/config;
  # home.file.".i3/config".source = ./dotfiles/i3wm/config;
  # home.file.".vimrc".source = ./dotfiles/vim/vimrc.symlink;

  home.packages = [
    lorri
    # pkgs.ruby
#    ag
#    awscli
#    bat
#    cabal-install
    # pkgs.csvkit
#    escrotum
#    emacs
#    clojure
#    docker
#    # google-chrome
#    pgcli
#    mycli
#    # rofi ;; installed through system packages instead
#    feh
#    maim
#    jq
#    openjdk8
#    leiningen
#    httpie
    pkgs.pandoc
#    pavucontrol
#    patchelf
#    binutils-unwrapped
#    python37Packages.libxml2 # xmllint
#    python37Packages.grip # for grip-mode live markdown previews in Emacs
#    python3Full
#    python37Packages.pip
#    qutebrowser
#    mplayer
#    dolphin
#    ranger
#    git
#    fzf
#    kubernetes
#    kustomize
#    usbutils
#    openvpn
#    slack
#    stack
#    # u-tool
#    xclip
#    # firefox-bin
#    telnet
#    tree
#    glibcLocales
#    # tcpdump
  ];

  imports = [
    #     ./imports/autorandr.nix
    ./imports/neovim.nix
    #     ./imports/bash.nix
    #     ./imports/session-variables.nix
    #     ./imports/emacs.nix
    #     ./imports/keyboard.nix
    ./imports/git.nix
    #     ./imports/ssh.nix
    #     ./imports/termite.nix
    #     ./imports/firefox.nix
    #     ./imports/i3.nix
  ];

  # Custom software that didn't work through home-manager (on MacOS):
  # - tabnine (no exist)
  # - grpccurl (no exist)
  # - circleci (no exist)
  # iterm2 (compile fail)
  # - termite (no worky on Darwin)
  # - st (no worky on Darwin)

  # systemd.user.sockets.lorri = {
  #   Unit = { Description = "lorri build daemon"; };
  #   Socket = { ListenStream = "%t/lorri/daemon.socket"; };
  #   Install = { WantedBy = [ "sockets.target" ]; };
  # };

  # systemd.user.services.lorri = {
  #   Unit = {
  #     Description = "lorri build daemon";
  #     Documentation = "https://github.com/target/lorri";
  #     ConditionUser = "!@system";
  #     Requires = "lorri.socket";
  #     After = "lorri.socket";
  #     RefuseManualStart = true;
  #   };

  #   Service = {
  #     ExecStart = "${pkgs.lorri}/bin/lorri daemon";
  #     PrivateTmp = true;
  #     ProtectSystem = "strict";
  #     WorkingDirectory = "%h";
  #     Restart = "on-failure";
  #     Environment = "PATH=${path} RUST_BACKTRACE=1";
  #   };
  # };
}
