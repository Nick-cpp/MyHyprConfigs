set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set relativenumber
syntax on
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
set clipboard=unnamedplus
set so=30
set incsearch
set autoindent
set smartindent
set ignorecase
set ttyfast
set nocompatible
set encoding=utf8
filetype plugin indent on

call plug#begin("~/.vim/plugged")
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 1
highlight SyntasticError cterm=underline ctermfg=red
highlight SyntasticWarning cterm=underline ctermfg=yellow
let g:NERDCreateDefaultMappings = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#formatter = 'default'

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
