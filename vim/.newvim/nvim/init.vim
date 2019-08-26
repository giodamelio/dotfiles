"""" Be VIM """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is not necessary with Neovim, but it still here incase this config ever needs to be loaded with vim
set nocompatible

"""" Load plugins with vim-plug """"""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.newvim/nvim/plugged')

" Color themes
Plug 'crusoexia/vim-monokai'

" Language support
Plug 'sheerun/vim-polyglot'

" Other
Plug 'mhinz/vim-signify' " Shows version control status in sign column
Plug 'itchyny/lightline.vim' " Awesome statusline

call plug#end()

"""" Vanilla Configs """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No need to show the mode since lightline shows it in the statusbar
set noshowmode

""""" Plugin Configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"""" Colorscheme """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme monokai
