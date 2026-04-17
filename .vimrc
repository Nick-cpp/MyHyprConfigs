syntax on

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set relativenumber
set number
set clipboard=unnamedplus
set so=30
set autoindent
set smartindent
set ignorecase
set ttyfast
set nocompatible
set encoding=utf8
set nohlsearch
set incsearch
filetype plugin indent on

call plug#begin("~/.vim/plugged")
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
call plug#end()

highlight SyntasticError cterm=underline ctermfg=red
highlight SyntasticWarning cterm=underline ctermfg=yellow

highlight Pmenu ctermbg=black ctermfg=white guibg=#000000 guifg=#ffffff
highlight PmenuSel ctermbg=blue ctermfg=black guibg=#0000ff guifg=#000000

let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 1
let g:NERDCreateDefaultMappings = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#formatter = 'default'

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
