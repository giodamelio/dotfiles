" Setup Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" Turn on syntax and filetype detection
syntax on
filetype plugin indent on

" Set location for backup and swap files
set backupdir=~/tmp/.vim/backup//
set directory=~/tmp/.vim/swap//

" Set our colorscheme to molokai
colorscheme Monokai
