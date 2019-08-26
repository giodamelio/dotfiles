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
Plug 'moll/vim-bbye' " Well behaved :bdelete
Plug 'rhysd/clever-f.vim' " Better mappings for finding things
Plug 'roxma/nvim-yarp' " A remote plugin framework used by other plugins
Plug 'ncm2/ncm2' " Completion framework
Plug 'ncm2/ncm2-bufword' " Complete words in the current buffer
Plug 'ncm2/ncm2-path' " Complete paths from current buffer/cwd/root
Plug 'ncm2/ncm2-tmux' " Complete text from adjacent tmux panes
Plug 'filipekiss/ncm2-look.vim' " Complete words from the system dictionary


call plug#end()

"""" Vanilla Configs """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No need to show the mode since lightline shows it in the statusbar
set noshowmode

""""" Plugin Configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"" ncm2
" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""" Colorscheme """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme monokai
