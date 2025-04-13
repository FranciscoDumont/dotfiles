" =^..^=   =^..^=   =^..^=    Plugins    =^..^=    =^..^=    =^..^=
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'matze/vim-move'
Plug 'preservim/nerdcommenter'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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

" Nerd Commenter
let g:NERDSpaceDelims = 1
" <leader>c<space> to togle comments

" TagBar
let g:tagbar_autofocus = 1
map <F3> :TagbarToggle<CR>

" Gutentags
set statusline+=%{gutentags#statusline()}

" VimWiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
let g:vimwiki_folding = 'custom'
let g:vimwiki_key_mappings = { 'table_mappings': 0 } " El Tab choca con copilot

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
colorscheme catppuccin-macchiato
let g:airline_theme='catppuccin'


" =^..^=   =^..^=   =^..^=    Maps    =^..^=    =^..^=    =^..^=
let mapleader =" "

" jj to escape
imap jj <Esc>

" Don't use Ex mode, use Q for formatting.
map Q gq

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

" Colorizer
lua require'colorizer'.setup()

