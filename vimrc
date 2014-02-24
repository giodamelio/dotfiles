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
set gdefault    " Use the `g` flag by default.

"""" Plugin Configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Gitgutter
" Always show the gitgutter sign column
let g:gitgutter_sign_column_always = 1

"" Airline
" Enable it
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"""" Color Scheme """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set our colorscheme to solorized dark
set background=dark
colorscheme monokai
