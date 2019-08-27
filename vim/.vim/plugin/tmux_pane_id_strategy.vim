let s:target_pane_file = '/tmp/vim-tmux-target-pane'

" Run a the test in a tmux pane id read from a tmpfile
function! TmuxPaneIdStrategy(cmd) abort
  if filereadable(s:target_pane_file)
    let l:target_pane = readfile(s:target_pane_file)
    let l:target_pane = l:target_pane[0]
  else
    echo 'No currently targeted pane'
    return
  endif

  call system("tmux send-keys -t '" . l:target_pane . "' " . shellescape(a:cmd) . ' C-m')
endfunction

let g:test#custom_strategies.tmux_pane_id = function('TmuxPaneIdStrategy')

" Wrap a test command and set the strategy to 'tmux_pane_id' if the file exists
function! WrapTestCommand(test_command) abort
  if filereadable(s:target_pane_file)
    let g:test#strategy = 'tmux_pane_id'
  else
    let g:test#strategy = 'basic'
  endif
  execute a:test_command
endfunction
