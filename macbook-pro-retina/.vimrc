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

call pathogen#helptags()
call pathogen#infect()

let mapleader=","

nmap <silent> <leader>ev :edit $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

nmap <silent> <leader>w :BufExplorer<CR>

nmap <silent> <leader>/ :nohlsearch<CR>

" --- INSTALLED PLUGINS ---
" https://github.com/pangloss/vim-javascript
" --- END INSTALLED PLUGINS ---


" ------
" GENERAL
" ------

" Show line numbers
set number

" Turn on syntax highlighting
syntax on

" Do not break lines
set nowrap

" If I decide to set wrap,
" it's probably because I'm writing/reading regular text
" so break at word boundaries
set linebreak

" Skim templates should receive the same syntax highlighting as Slim templates
au BufNewFile,BufRead *.skim set filetype=slim
au BufRead,BufRead *.skim set filetype=slim


" Credit - http://damien.lespiau.name/blog/2009/03/18/per-project-vimrc/comment-page-1/
" -------------------------------------------------------------------------------------
" Enable per-directory .vimrc files
set exrc

" Disable unsafe commands in local .vimrc files
set secure


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

" Highlight search results
" set nohls
set hlsearch

" Show matches while searching
set incsearch

" Ignore case when searching
set ignorecase

" Fix backspace not working
set nocompatible
set backspace=2

" Search results to black text color so I can actually see them!
highlight Search ctermfg=black


let g:ctrlp_path_nolim = 1
let g:ctrlp_max_files = 100000

" --------
" KEY MAPS
" --------

" Automatically reselect previous selected VISUAL selection immediately after
" indenting
:vmap > >gv
:vmap < <gv

" Copy visual selection to the clipboard
:vmap "" "+y

" Credit - 'Ben Schmidt' at 'http://vim.1045645.n5.nabble.com/Open-file-relative-to-current-file-s-directory-td1181344.html'
" Map '%/' to current working directory
:cmap %/ <C-r>=expand('%:p:h')<CR>/

:hi Visual term=reverse cterm=reverse guibg=Grey
:highlight PmenuSel ctermfg=0 ctermbg=6

:hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
:hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Copy current filename to clipboard
" ----------------------------------
" ,cs copies just the filename.
" ,cl copies the filename including it's full path.
" ,c8 copies the filename in 8.3 format for DOS and Windows 9x
"
" Convert slashes to backslashes for Windows.
if has('win32')
  nmap ,cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap ,cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @*=expand("%")<CR>
  nmap ,cl :let @*=expand("%:p")<CR>
endif

"" Taken from work

colorscheme darkblue
set cursorline
set colorcolumn=80

" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
" almost black - I like this one a lot
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE

" hi CursorLine cterm=underline
" hi CursorLine gui=underline

nnoremap H :set cursorline! cursorcolumn!<CR>

" set the prefered colours, pick one line here only.
" " dark grey, better you can get if you don't support 256 colours
" hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE
" " light grey, no 256 colors
" hi CursorLine   cterm=NONE ctermbg=7 ctermfg=NONE
" " dark redish
" hi CursorLine   cterm=NONE ctermbg=52 ctermfg=NONE
" " dark bluish
" hi CursorLine   cterm=NONE ctermbg=17 ctermfg=NONE
" " very light grey
" hi CursorLine   cterm=NONE ctermbg=254 ctermfg=NONE
" " yelowish
" hi CursorLine   cterm=NONE ctermbg=229 ctermfg=NONE
" " almost black
" hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE


" From Damian Conway 'more instantly better vim'
" https://www.youtube.com/watch?v=aHm36-na4-4&feature=youtu.be#t=4m59s

exec "set listchars=tab:\uBB\uBB,nbsp:_,trail:\u00AC"
set list

let g:bufExplorerShowRelativePath=1

runtime macros/matchit.vim

" Powerline fonts for vim-airline
let g:airline_powerline_fonts = 1

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
