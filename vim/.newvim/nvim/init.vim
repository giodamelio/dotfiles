"""" Be VIM """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is not necessary with Neovim, but it still here incase this config ever needs to be loaded with vim
set nocompatible

"""" Load plugins with vim-plug """"""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.newvim/nvim/plugged')

" Color themes
Plug 'crusoexia/vim-monokai'

" Language support
Plug 'sheerun/vim-polyglot'

call plug#end()

"""" Colorscheme """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme monokai
