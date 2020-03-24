{ config ? null, pkgs ? import <nixpkgs> {} }:

pkgs.vim_configurable.customize {
  name = "vim";

  vimrcConfig.customRC = ''
    set hidden
  '';

  vimrcConfig.plug.plugins = [
        "jlanzarotta/bufexplorer"
        "tpope/vim-surround"
        "tpope/vim-fireplace"
        "tpope/vim-salve"
        "scrooloose/nerdtree"
        "airblade/vim-gitgutter"
        "lifepillar/vim-solarized8"

        "clojure-vim/async-clj-omni"

        "triglav/vim-visual-increment"

          # junegunn/fzf, { 'dir': '~/.fzf', 'do': './install --all' }
          # junegunn/fzf.vim

          "majutsushi/tagbar"

          "jremmen/vim-ripgrep"

          "reasonml-editor/vim-reason-plus"

          #autozimu/LanguageClient-neovim, {
            #\ 'branch': 'next',
            #\ 'do': 'bash install.sh',
            #\ }

          #'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
          # 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    ];
  }
