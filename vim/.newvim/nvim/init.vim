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
Plug 'ncm2/ncm2-ultisnips' " Complete from utilsnips
Plug 'SirVer/ultisnips' " Snippet framework
Plug 'honza/vim-snippets' " A library of preexisting snippits
Plug 'tomtom/tcomment_vim' " Handle comments
Plug 'tpope/vim-eunuch' " Unix command helper
Plug 'tpope/vim-repeat' " Allow . repeat to work with supported plugins
Plug 'tpope/vim-surround' " Easily manipulate surrounding things
Plug 'valloric/MatchTagAlways' " Highlight matching HTML/XML tags
Plug 'wellle/targets.vim' " Add more text objects
Plug 'luochen1990/rainbow' " Make the parens rainbow!
Plug 'christoomey/vim-tmux-navigator' " Easily navigate within tmux

call plug#end()

"""" Vanilla Configs """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No need to show the mode since lightline shows it in the statusbar
set noshowmode

" Turn on syntax and filetype detection
syntax on
filetype plugin indent on

" Show line numbers
set number
set relativenumber

" Setup tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab       " Use spaces instead of tabs
set smarttab        " Let's tab key insert 'tab stops', and bksp deletes tabs
set shiftround      " Tab/shifting moves to closest tabstop
set autoindent      " Match indents on new lines
set smartindent     " Auto indent when needed

" Autoreload changed files without asking
set autoread

" Sane backspace
set backspace=indent,eol,start

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

" Use c-j c-k for moving in snippet
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

"" Rainbow parens
let g:rainbow_active = 1 " Enable globally

"""" Colorscheme """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme monokai
