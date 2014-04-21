" --------
" PATHOGEN
" --------

" Manage your 'runtimepath' with ease. In practical terms, pathogen.vim makes
" it super easy to install plugins and runtime files in their own private
" directories.
"
" execute pathogen#infect()
" syntax on
" filetype plugin indent on
"
" plugins are installed under .vim/bundle

call pathogen#infect()



" ------
" GENERAL
" ------

" Show line numbers
set number

" Turn on syntax highlighting
syntax on

" Do not break lines
set nowrap



" ----------
" INDENTATION
" ----------

" Copies indentation from previous line
" 'autoindent' does not interfere with filetype based indentation
set autoindent
"
" Indents before '}' and matches indentation of '}' to matching '{'
" (no it doesn't)
" set smartindent

" Use spaces instead of tabs
set expandtab

" Number of spaces to move when '<<', '>>', and '==' commands are used
set shiftwidth=2

" Number of spaces to insert when press <TAB> -- should be the same value as shiftwidth
set softtabstop=2


" -------
" FILETYPE
" -------

" Enable plugins for specific file types
filetype plugin on

" Enable customisation of indentation based on filetype
" Indentation scripts are in ~/.vim/indent
filetype plugin indent on



" --------
" SEARCHING
" --------

" Do not highlight search results
set nohls

" Show matches while searching
set incsearch

" Ignore case when searching
set ignorecase



" --------
" KEY MAPS
" --------

" Automatically reselect previous selected VISUAL selection immediately after
" indenting
:vmap > >gv
:vmap < <gv
