" defaults
syntax on

set autoindent
set smartindent
set showmatch
set matchtime=3

" default configuration for all files is 2 space
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" default for Rust (.rs) files
autocmd Filetype rust setlocal tabstop=4 softtabstop=4 shiftwidth=2 expandtab smarttab

" for custom scheme and background for gruvbox
autocmd vimenter * colorscheme gruvbox
set bg=dark

" final command
autocmd VimEnter * highlight Normal ctermbg=0
