{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "***********";
  home.homeDirectory = "*************";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = with pkgs; [
    ag
    awscli
    bat
    coreutils
    csvkit
    direnv
    docker
    fzf
    gnupg
    jq
    lorri
    mycli
    pandoc
    pgcli
    ranger
    rxvt-unicode
    telnet
    tree
  ];

  # Custom software that didn't work through home-manager (on MacOS):
  # - tabnine (no exist)
  # - grpccurl (no exist)
  # - circleci (no exist)
  # iterm2 (compile fail)
  # - termite (no worky on Darwin)
  # - st (no worky on Darwin)

  programs.git = {
    enable = true;
    userName = "*****";
    userEmail = "***********";
    aliases = {
      unstage = "reset HEAD --";
      pr = "pull --rebase";
      co = "checkout";
      ci = "commit";
      br = "branch";
      st = "status";
      gong = "commit --amend --no-edit";
      gianf = "push --force-with-lease";
      l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
      pp = "!git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)";
      recent-branches = "branch --sort=-committerdate";
    };
    extraConfig = {
      core = { editor = "emacs"; };
      rerere.enabled = true;
    };
    signing = {
      signByDefault = true;
      key = "************";
    };
  };
}
