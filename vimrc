"""" Vundle Setup """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    " be iMproved, required
filetype off        " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""" Here be the plugins """"""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'sickill/vim-monokai'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'digitaltoad/vim-jade'
Plugin 'bling/vim-airline'
Plugin 'moll/vim-bbye'

"""" Vundle Teardown """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()   " required

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
set smartindent     " InPlugin 'sickill/vim-monokai'tellegently dedent/indent new lines based on rules

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
let mapleader = "\<Space>"

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

" Stop auto-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable Arrow
map <Up> <NOP>
map <Down> <NOP>
map <Left> <P>
map <Right> <P>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Swap lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Allow the cursor to go to the end of the line
set virtualedit=onemore

" Minimal ui
set guioptions=ae

" Leader+w saves all buffers
noremap <Leader>w :wa!<CR>

""""" Plugin Configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Gitgutter
" Always show the gitgutter sign column
let g:gitgutter_sign_column_always = 1

"" Airline
" Enable it
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"" bbye
nnoremap <Leader>q :Bdelete<CR>

"" Unite
" File search
"nnoremap <C-p> :Unite -start-insert file_rec/async<cr>

" Content search
"nnoremap <space>/ :Unite grep:.<cr>

" Quick buffer switching
"nnoremap <space>s :Unite -quick-match buffer<cr>
"nnoremap <space>a :Unite -start-insert buffer<cr>

" Use ag for searching(to follow .gitignores)
"let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".git" --hidden -g ""'


""""" Color Scheme """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Set our colorscheme to solorized dark
set background=dark
colorscheme monokai

