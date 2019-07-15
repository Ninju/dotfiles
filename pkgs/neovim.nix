{ ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    configure = {
      customRC = builtins.readFile ../pre-migration/vim/vimrc.symlink;
    };
  };
}
