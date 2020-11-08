{ pkgs, nur, ... }:

with pkgs;
let
  # nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in
{
  programs.firefox = {
    enable = true;
    # extensions = with nur.repos.rycee.firefox-addons; [
    #   altair
    # ];
  };
}
