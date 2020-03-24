{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    plugins = [
      "ctrlp"
      "fugitive"
      "editorconfig-vim"
      "surround"
      "vim-colorschemes"
    ];
    extraConfig = builtins.readFile ../pre-migration/vim/vimrc.symlink;
  };
}
