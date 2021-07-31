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
    extraConfig = builtins.readFile ./dotfiles/vim/vimrc.symlink;
  };
}
