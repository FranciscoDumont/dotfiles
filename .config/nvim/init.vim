" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()


" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" ↓ This fix the Airline theme ‾\_(ツ)_/‾
autocmd VimEnter * AirlineTheme jellybeans
autocmd VimEnter * AirlineTheme deus

" Nerd Tree
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:NERDTreeChDirMode = 2
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
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
set updatetime=100


" Deoplete
let g:deoplete#enable_at_startup = 1


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
set mouse=a


let mapleader =" "

" Leader + t: Run FZF
map <leader>t :FZF<CR>

" Leader + s: Remove unwanted spaces
map <leader>s :%s/\s\+$//e<CR>

" Leader + y/p: Copy and paste to clipboard
map <leader>y "+y
map <leader>p "+p

" Leader + g: Run Goyo
map <leader>g :Goyo<CR>

" Leader + b/p/n Buffers
nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>N :bprevious<CR>
nnoremap <leader>n :bnext<CR>
