"""" Be VIM """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is not necessary with Neovim, but it still here incase this config ever needs to be loaded with vim
set nocompatible

"""" Load plugins with vim-plug """"""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Color themes
Plug 'crusoexia/vim-monokai'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'Olical/conjure', { 'do': 'bin/compile' } " Clojure repl connection

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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ } " Language server connection. Works with ncm2
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
Plug 'liuchengxu/vim-which-key' " Interactive keybinding help
Plug 'tpope/vim-fugitive' " Git interface
Plug 'tpope/vim-rhubarb' " Github plugin for fugitive
Plug 'justinmk/vim-dirvish' " Simple directory viewer
Plug 'tpope/vim-projectionist' " Project configurations
Plug 'christoomey/vim-tmux-runner' " Tmux integration
Plug 'kshenoy/vim-signature' " Show marks in signs
Plug 'liuchengxu/vim-clap' " Generic finder
Plug 'ncm2/float-preview.nvim' " Floating completion
Plug 'troydm/zoomwintab.vim' " Temporarly full screen a buffer
Plug 'rhysd/git-messenger.vim' " Show git commit under cursor
Plug 'eraserhd/parinfer-rust', {'do':
        \ 'nix-shell --run \"cargo build --release \"'} " Awesome lisp editing

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

" Highlight the current line
set cursorline

" Completly disable mouse
set mouse=

" Make the terminal use truecolor
set termguicolors

" Disable auto comments on <enter> or `o`
" see :help formatoptions? and :help fo-table
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

"""" Bindings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Leader Key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

" Disable Arrow keys
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

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

" Neovim specific bindings
if has('nvim')
  " Easily go to normal mode from terminal mode
  tmap <C-o> <C-\><C-n>
endif

" Whichkey binding names
let g:which_key_map = {}

" ALE Errors
let g:which_key_map['e'] = {
      \ 'name': '+errors',
      \ 'n': ['ALENextWrap', 'Next error'],
      \ 'p': ['ALEPreviousWrap', 'Previous error'],
      \ 'd': ['ALEDetail', 'Detailed error'],
      \ 't': ['ALEToggle', 'Enable/Disable (toggle)'],
      \ 'b': ['ALEToggleBuffer', 'Enable/Disable for buffer (toggle)'],
      \ '=': ['ALEFix', 'Run fixer']
      \}

" Comments
let g:which_key_map['c'] = {
      \ 'name': '+comments',
      \ 'l': ['TComment', 'Comment line'],
      \ 'y': ['CopyAndComment', 'Copy and comment a selection']
      \}

" Git operations
let g:which_key_map['g'] = {
      \ 'name': '+git',
      \ 'g': ['Gstatus', 'Git status window'],
      \ 'b': ['Gblame', 'Git blame'],
      \ 'o': ['Gbrowser', 'Open current file in browser'],
      \ 'n': ['SignifyHunkNextWrap', 'Next changed hunk'],
      \ 'p': ['SignifyHunkPrevWrap', 'Previous changed hunk']
      \}

" Buffers
let g:which_key_map['b'] = {
      \ 'name': '+buffers',
      \ 'b': [':Clap buffers', 'Switch buffers'],
      \ 'd': ['Bdelete', 'Close a buffer'],
      \ 'n': ['enew', 'Create new buffer']
      \}

" Search
let g:which_key_map['s'] = {
      \ 'name': '+search',
      \ 's': [':Clap blines', 'Search lines (current buffer)'],
      \ 'S': [':Clap lines', 'Search lines (all buffers)'],
      \ 'm': [':Clap marks', 'Search marks'],
      \ 'r': [':Clap history', 'Search recent files'],
      \ 'f': [':Clap files', 'Search files'],
      \ 'c': [':Clap command', 'Search commands'],
      \ 'C': [':Clap command_history', 'Search command history'],
      \ 'g': [':Clap bcommit', 'Search commit history (current buffer)'],
      \ 'G': [':Clap commits', 'Search commit history (all buffers)']
      \}

" Project
let g:which_key_map['p'] = {
      \ 'name': '+project',
      \ 'f': [':Clap gfiles', 'Find files in project (files tracked by git)']
      \}

" Repl
let g:which_key_map['r'] = {
      \ 'name': '+repl',
      \ 't': ['VtrSendLinesToRunner', 'Send selection to tmux']
      \}

" Testing
let g:which_key_map['t'] = {
      \ 'name': '+testing',
      \ 't': ['WrapTestCommand("TestFile")', 'Run this file'],
      \ 'n': ['WrapTestCommand("TestNearest")', 'Run the test nearest to the cursor'],
      \ 's': ['WrapTestCommand("TestSuite")', 'Run the entire test suite'],
      \ 'l': ['WrapTestCommand("TestLast")', 'Run the last test ran'],
      \ '<Tab>': ['A', 'Switch to matching test/code']
      \}

" Language Server
let g:which_key_map['l'] = {
      \ 'name': '+lang-server',
      \ 'l': ['LanguageClient_contextMenu()', 'Open context menu'],
      \ 'd': ['LanguageClient#textDocument_definition()', 'Go do definition'],
      \ 'r': ['LanguageClient#textDocument_references()', 'Show references'],
      \ 'x': ['LanguageClient#textDocument_rename()', 'Rename symbol'],
      \}

call which_key#register('<Space>', "g:which_key_map")

""""" Plugin Configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'git_info', 'ale_errors' ] ]
      \ },
      \ 'component': {
      \   'ale_errors': 'ALE: %#ALEErrorColor#%{CurrentBufferALEErrorsCount()}'
      \ },
      \ 'component_function': {
      \   'git_info': 'fugitive#statusline'
      \ }
      \ }

"" ncm2
" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd TextChangedI * call ncm2#auto_trigger()

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
" Set strategies
let g:test#strategy = 'basic'

" Define custom strategies
" They will be added from withing their `plugin/` files because the functions
" must be defined before the dictionary is set
let g:test#custom_strategies = {}

"" ALE
" Set the fixers for some filetypes
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'vue': ['prettier'],
\   'rust': ['rustfmt'],
\   'elixir': ['mix_format']
\}

" Set the linters for some filetypes
let g:ale_linters = {
\   'clojure': ['clj-kondo', 'joker']
\}

" Run the fixers automatically on save
let g:ale_fix_on_save = 1

"" Which key
" Hide the statusline
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"" Language Server
" Setup the commands for the language servers
    " \ 'rust': ['rls'],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ }

let g:LanguageClient_loggingFile = expand('~/tmp/LanguageClient.log')
let g:LanguageClient_loggingLevel = 'DEBUG'

"" Conjure
" Setup the log
let g:conjure_log_direction="horizontal"
let g:conjure_log_size_small=20

" Add a custom binding to reload changed then eval the form at mark A
autocmd FileType clojure nnoremap <localleader>ea :ConjureRefresh changed<cr>:ConjureEvalFormAtMark<cr>A

"""" Colorscheme """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme monokai
