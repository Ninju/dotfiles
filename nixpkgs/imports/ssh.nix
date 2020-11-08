{ config, pkg, ... }:

let
  homedir = builtins.getEnv "HOME";
in
  {
    programs.ssh = {
      enable = true;
      forwardAgent = true;
      matchBlocks = {
        gh = {
          hostname = "github.com";
          user = "git";
          identityFile = "${homedir}/.ssh/id_rsa";

          identitiesOnly = true;
        };
      };
    };
  }
