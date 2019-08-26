function! SourceCurrentFile()
  execute 'source ' . bufname('%')
  echo 'Sourced current file'
endfunction
command! SourceCurrentFile call SourceCurrentFile()

" Local leaders mappings
let b:which_key_map = {
      \ 's': ['SourceCurrentFile', 'Source the current file']
      \}

call which_key#register(',', 'b:which_key_map')
