" =^..^=   =^..^=   =^..^=    Plugins    =^..^=    =^..^=    =^..^=
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'matze/vim-move'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdcommenter'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()


" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" GitGutter
let g:gitgutter_map_keys = 0

" Nerd Tree
let g:airline_powerline_fonts = 1
let g:NERDTreeChDirMode = 2
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
map <F2> :NERDTreeToggle<CR>

" DevIcons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Neerd Commenter
let g:NERDSpaceDelims = 1
" <leader>c<space> to togle comments

" TagBar
let g:tagbar_autofocus = 1
map <F3> :TagbarToggle<CR>

" Deoplete
set updatetime=100
let g:deoplete#enable_at_startup = 1

" Gutentags
set statusline+=%{gutentags#statusline()}

" VimWiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
let g:vimwiki_folding = 'custom'

" Startify
let g:startify_fortune_use_unicode = 1
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_skiplist = [
       \ '\.vimgolf',
       \ '^/tmp',
       \ '/project/.*/documentation',
       \ escape(fnamemodify($HOME, ':p'), '\') .'mysecret.txt',
       \ './Dropbox',
       \ ] " Add Dropbox folder to the skiplist



" =^..^=   =^..^=   =^..^=   Basic Settings   =^..^=    =^..^=    =^..^=
set autoindent             " New lines inherit the indentation of previous lines.
set autoread               " Automatically re-read files if unmodified inside Vim
set tabstop=4              " Indent using four spaces
set shiftwidth=4           " When shifting, indent using four spaces
set expandtab              " Convert tabs to spaces
set number relativenumber  " Show relative numbers on other lines.
set ignorecase             " Ignore case when searching
set incsearch              " Incremental search that shows partial matches
syntax on                  " Enable syntax highlighting
set mouse=a                " Enable mouse for scrolling and resizing
set autochdir              " Automatically change the current directory
set clipboard=unnamedplus  " Use the clipboard as the default register
set foldmethod=marker      " Activate folding using three curly braces
set scrolloff=5            " Show a few lines of context around the cursor.


" =^..^=   =^..^=   =^..^=    Color scheme    =^..^=    =^..^=    =^..^=
set termguicolors
set background=dark
colorscheme palenight
let g:airline_theme='palenight'
let g:palenight_terminal_italics=1


" =^..^=   =^..^=   =^..^=    Maps    =^..^=    =^..^=    =^..^=
let mapleader =" "

" jj to escape
imap jj <Esc>

" Don't use Ex mode, use Q for formatting.
map Q gq

" Leader + p: Run FZF
function! FZFGit()
    let directory = substitute(system('git rev-parse --show-toplevel'), '\n$', '', '')
    call fzf#run({'sink':'tabedit', 'dir':directory, 'window':{'width': 0.9, 'height': 0.6}})
endfunction
map <leader>p :map <lt>leader>p<CR>
map <leader>pp :BTags<CR>
map <leader>pP :Tags<CR>
map <leader>pf :call FZFGit()<CR>
map <leader>pg :GFiles<CR>
map <leader>ph :History<CR>
map <leader>pb :Buffers<CR>
map <leader>pa :Ag <C-R><C-W><CR>

" Leader + g GitGutter
map <leader>g :map <lt>leader>g<CR>
map <leader>gg :Git<CR><C-W>L<C-W>40<
map <leader>gp :GitGutterPreviewHunk<CR>:wincmd w<CR>
map <leader>gs :GitGutterStageHunk<CR>
map <leader>gf :GitGutterFold<CR>
map <leader>gu :GitGutterUndoHunk<CR>
map <leader>gn :GitGutterNextHunk<CR>
map <leader>gN :GitGutterPrevHunk<CR>

" Leader + s: Remove unwanted spaces
map <leader>s :%s/\s\+$//e<CR>

" Leader + S: Remove unwanted spaces
map <leader>S :Startify<CR>

" Leader + r: Replace each occurrence of the word under the cursor.
map <leader>r :%s/<c-r><c-w>//gc<left><left><left>

" Leader + G: Run Goyo
map <leader>G :Goyo<CR>

" Leader + b/p/n Buffers
nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>N :bprevious<CR>
nnoremap <leader>n :bnext<CR>


" =^..^=   =^..^=   =^..^=    Misc    =^..^=    =^..^=    =^..^=
"Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Clear highlight on pressing ESC
nnoremap <silent> <esc> :noh<return><esc>

" Search in Google on pressing <F6>
function! GoogleSearch()
     let searchterm = getreg("g")
     silent! exec "silent! !firefox \"http://google.com/search?q=" . searchterm . "\" &"
endfunction
vnoremap <F6> "gy<Esc>:call GoogleSearch()<CR>

" Colorizer
lua require'colorizer'.setup()

