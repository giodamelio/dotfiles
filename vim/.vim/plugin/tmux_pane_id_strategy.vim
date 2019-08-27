" Run a the test in a tmux pane id read from a tmpfile
function! TmuxPaneIdStrategy(cmd) abort
  let l:target_pane_file = '/tmp/vim-tmux-target-pane'
  if filereadable(l:target_pane_file)
    let l:target_pane = readfile(l:target_pane_file)
    let l:target_pane = l:target_pane[0]
  else
    echo 'No currently targeted pane'
    return
  endif

  call system("tmux send-keys -t '" . l:target_pane . "' " . shellescape(a:cmd) . ' C-m')
endfunction

let g:test#custom_strategies.tmux_pane_id = function('TmuxPaneIdStrategy')
