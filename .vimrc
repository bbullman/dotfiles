set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

syntax on

set autoindent
set smartindent

set showmatch
set matchtime=3
inoremap <C-Return> <CR><CR><C-o>k<Tab>
inoremap ( ()<Esc>i
inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

autocmd vimenter * colorscheme gruvbox
set bg=dark

autocmd VimEnter * highlight Normal ctermbg=0
