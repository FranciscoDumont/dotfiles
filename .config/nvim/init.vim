" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
call plug#end()


" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


" Nerd Tree
let mapleader =" "
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:NERDTreeChDirMode = 2
map <F2> :NERDTreeToggle<CR>


" GitGutter
augroup vimrc_appearance | autocmd!
	autocmd ColorScheme * call s:vimrc_postcolorscheme()
augroup END
function! s:vimrc_postcolorscheme()
	" Configure gutter sign colours
	highlight GutterSignAdd    ctermfg=lightgreen
	highlight GutterSignChange ctermfg=yellow
	highlight GutterSignDelete ctermfg=green
endfunction
highlight link GitGutterAdd    GutterSignAdd
highlight link GitGutterChange GutterSignChange
highlight link GitGutterDelete GutterSignDelete


set autoindent
set autoread
set tabstop=4
set shiftwidth=4
set expandtab
colorscheme default
set background=dark
set number relativenumber
set ignorecase
set incsearch
syntax on


" Leader + t: Run FZF
map <leader>t :FZF<CR>

" Leader + s: Remove unwanted spaces
map <leader>s :%s/\s\+$//e<CR>
