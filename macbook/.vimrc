set nu
set shiftwidth=2
set expandtab
set tabstop=2
set guifont=Monaco:h12
set autoindent
set smartindent
set bs=2
set incsearch
set wildmenu
set autoread

syntax on
syntax enable

filetype on
filetype plugin on
filetype indent on

vmap <C-c> :!pbcopy<CR>
map <Leader>l :set list<CR>
map <Leader>nl :set nolist<CR>
map <Leader>cr :!cucumber %<CR>
map <Leader>sr :!spec %<CR>
map <Leader>rr :!rake<CR>
map <Leader>rc :!rake cruise<CR>
map <Leader>d :NERDTreeToggle<CR>
map <Leader>s :set spell<CR>
map <Leader>ns :set nospell<CR>
vm <Leader>s !ruby -e 'puts STDIN.lines.sort_by {rand}.join'<CR> 
