" default
syntax on
filetype plugin indent on

set autoindent
set smartindent
set showmatch
set matchtime=3

" default configuration for all files is 2 space
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" default for Rust (.rs) files
autocmd filetype rust setlocal tabstop=4 softtabstop=4 shiftwidth=2 expandtab smarttab

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_rust_checkers = ['cargo']

" for ctags
" let g:tagbar_ctags_bin = null 

" for taskbar
nnoremap <silent> <f8> :TagbarToggle<CR>

" for custom scheme and background for gruvbox
autocmd vimenter * colorscheme gruvbox
set bg=dark

" final command
autocmd VimEnter * highlight Normal ctermbg=0
