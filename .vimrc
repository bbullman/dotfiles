" default
syntax on
filetype plugin indent on

"set autoindent
"set smartindent
"set showmatch
"set matchtime=3

" default configuration for all files is 2 space
"set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" Settings: {{{
filetype indent plugin on
if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8
scriptencoding utf-8

set backspace=indent,eol,start
set expandtab
set smarttab
set shiftround
set shiftwidth=4
set softtabstop=-1
set tabstop=8
set title
set noinsertmode

set hidden
set nofixendofline
set nostartofline
set splitbelow
set splitright

set hlsearch
set incsearch
set laststatus=2
set nonumber
set noruler
set noshowmode
set signcolumn=yes

set mouse=
set updatetime=1000

" default for Rust (.rs) files
autocmd filetype rust setlocal tabstop=4 softtabstop=4 shiftwidth=2 expandtab smarttab
" }}}

" Colors: {{{
augroup ColorschemePreferences
  autocmd!
  " These preferences clear some gruvbox background colours, allowing transparency
  autocmd ColorScheme * highlight Normal     ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight Todo       ctermbg=NONE guibg=NONE
  " Link ALE sign highlights to similar equivalents without background colours
  autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
  autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
  autocmd ColorScheme * highlight link ALEInfoSign    Identifier
augroup END

colorscheme gruvbox
set background=dark
highlight Pmenu ctermbg=black guibg=black
highlight PmenuSel ctermbg=black guibg=black
highlight PmenuSbar ctermbg=black guibg=black
highlight PmenuThumb ctermbg=gray guibg=gray
" }}}

" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" Asyncomplete: {{{
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
        let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~ '\s'
        endfunction

        inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ asyncomplete#force_refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" }}}

" Sharpenup: {{{
" All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
" :OmniSharpGotoDefinition
let g:sharpenup_map_prefix = '<Space>os'
let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }
let g:sharpenup_statusline_opts = { 'Highlight': 0 }

augroup OmniSharpIntegrations
  autocmd!
  autocmd User OmniSharpStart,OmniSharpProjectUpdated,OmniSharpReady,OmniSharpStopped call lightline#update()
augroup END
" }}}

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ], 
      \              ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'] ],
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

" OmniSharp: {{{
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" }}}

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

" aliases
:command PP set paste

" for custom scheme and background for gruvbox
" autocmd VimEnter * colorscheme gruvbox

" final command
autocmd VimEnter * highlight Normal ctermbg=0
