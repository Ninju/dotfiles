{ config ? null , pkgs ? (import <nixpkgs> {}), ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython = true;
    withPython3 = true;

    configure = {
      customRC = builtins.readFile ../dotfiles/vim/vimrc.symlink;

      plug.plugins = with pkgs.vimPlugins; [
        vim-fireplace
        bufexplorer
        vim-surround
        nerdtree
        vim-gitgutter
        tagbar
        colors-solarized

        # deoplete
        # fzf
        # vim-salve
        # vim-visual-increment
        # vim-ripgrep
        # vim-solarized8
      ];
    };
  };
}
