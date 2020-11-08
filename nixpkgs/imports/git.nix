{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "***";
    userEmail = "***";
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
#   signing = {
#     signByDefault = true;
#     key = "************";
#   };
  };
}
