"""" Pathogen Setup """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

"""" Vanilla Configs """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on syntax and filetype detection
syntax on
filetype plugin indent on

" Set location for backup and swap files
set backupdir=~/tmp/.vim/backup//
set directory=~/tmp/.vim/swap//

" Show line numbers
set number

" Don't show the mode in the status line
set noshowmode

" Setup tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab       " Use spaces instead of tabs
set smarttab        " Let's tab key insert 'tab stops', and bksp deletes tabs
set shiftround      " Tab/shifting moves to closest tabstop
set autoindent      " Match indents on new lines
set smartindent     " Intellegently dedent/indent new lines based on rules

" Autoreload changed files without asking
set autoread

" Make search better
set ignorecase  " Case insensitive search
set smartcase   " If there are uppercase letters, become case-sensitive
set incsearch   " Live incremental searching
set showmatch   " Live match highlighting
set hlsearch    " Highlight matches
set gdefault    " Use the `g` flag by default

" Set Leader Key
let mapleader = ","

" Bind ';' to ':' so we don't have to press shift to input a command
nnoremap ; :
vnoremap ; :

" Bind jj to esc to exit insert mode faster
inoremap jj <esc>

" Change shortcuts for copy, cut and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Allow hidden buffers without and error
set hidden

" Better shortcuts for switching between buffers
nnoremap <Leader>. :bn<CR>
nnoremap <Leader>m :bp<CR>

"""" Plugin Configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Gitgutter
" Always show the gitgutter sign column
let g:gitgutter_sign_column_always = 1

"" Airline
" Enable it
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"" ControlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" NerdTree
" Run nerdtree if vim starts with no files to open
autocmd vimenter * if !argc() | NERDTree | endif

" Custom shortcut to toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

"""" Color Scheme """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set our colorscheme to solorized dark
set background=dark
colorscheme monokai
