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
