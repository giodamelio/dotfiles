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
Plug 'justinmk/vim-sneak' " Add a motion to quickly jump to text
Plug 'janko/vim-test' " Quickly and easily run unit tests
Plug 'benmills/vimux' " Easily run a command in a small tmux pane
Plug 'dense-analysis/ale' " Run linters

call plug#end()

"""" Options """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Make search better
set ignorecase " Case insensitive search
set smartcase  " If there are uppercase letters, become case-sensitive
set incsearch  " Live incremental searching
set showmatch  " Live match highlighting
set hlsearch   " Highlight matches
set gdefault   " Use the `g` flag by default

" Allow hidden buffers without and error
set hidden

" Allow modelines
set modeline

" Use system clipboard by defautl
set clipboard=unnamedplus

" Show whitespace at the end of the line
set list listchars=trail:·

" Make the cursor stay in the center of the screen when possable
set scrolloff=9999

"""" Bindings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Leader Key
let mapleader = "\<Space>"

" Bind jk to esc to exit insert mode faster
inoremap jk <esc>
xnoremap jk <esc>

" Disable Arrow keys
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

" Disable escape key
imap <Esc> <NOP>

" Toggle between current and previously edited file
map <leader><tab> <C-^>

" ROT13 Madness
map <F5> ggg?G``

" Text operator for entire file
onoremap af :<C-u>normal! ggVG<CR>

" Make Y yank the rest of the line
noremap Y y$

" Stay in visual move after indenting
vnoremap < <gv
vnoremap > >gv

""""" Plugin Configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'ale_errors', 'ale_ok' ] ]
      \ },
      \ 'component_expand': {
      \   'ale_errors': 'CurrentBufferALEErrorsCount',
      \   'ale_ok': 'CurrentBufferALEOk'
      \ },
      \ 'component_type': {
      \   'ale_errors': 'error',
      \   'ale_ok': 'warning'
      \ }
      \ }

" Get the count of the ALE errors of the current buffer
function! CurrentBufferALEErrorsCount()
  let l:counts = ale#statusline#Count(bufnr(''))

  return l:counts.total == 0 ? '' : printf(
    \ 'ALE: %d errors',
    \ l:counts.total
  \)
endfunction

" Get the count of the ALE errors of the current buffer
function! CurrentBufferALEOk()
  let l:counts = ale#statusline#Count(bufnr(''))

  return l:counts.total == 0 ? 'ALE: Ok' : ''
endfunction

" Update the lightline if the plugin exists
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Update the lightline when ALE does it's thing
augroup _lightline
  autocmd!
  autocmd User ALEFixPre   call lightline#update()
  autocmd User ALEFixPost  call lightline#update()
  autocmd User ALELintPre  call lightline#update()
  autocmd User ALELintPost call lightline#update()
augroup END

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

"" Sneak
let g:sneak#s_next = 1

"" Test
let test#strategy = {
  \ 'nearest': 'vimux',
  \ 'file':    'basic',
  \ 'suite':   'basic',
  \}

"""" Colorscheme """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme monokai
