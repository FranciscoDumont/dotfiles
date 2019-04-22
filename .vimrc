" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'
call plug#end()

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set autoindent
set tabstop=4
colorscheme default
set background=dark
set number relativenumber
set ignorecase
syntax on

let mapleader =" "
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" Leader + t: Run FZF
map <leader>t :FZF<CR>

" Leader + s: Remove unwanted spaces
map <leader>s :%s/\s\+$//e<CR>
