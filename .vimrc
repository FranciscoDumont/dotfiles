call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set autoindent
set tabstop=4
colorscheme default
set background=dark
set number
syntax on

let g:airline_powerline_fonts = 1
