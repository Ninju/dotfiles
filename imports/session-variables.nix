{ config, pkgs, ... }:

{
  home.sessionVariables = {
    TERMINAL = "termite";
    EDITOR = "vim";

    DO = "~/.dotfiles";
    U = "/home/alex/src/github.com/uswitch";
    FE = "/home/alex/src/github.com/uswitch/affiliate-feeds";
    API = "/home/alex/src/github.com/uswitch/affiliate-products-api";
  };

}
