function! s:files_rg()
  call fzf#run(fzf#wrap({
        \ 'sink': 'e',
        \ 'source': 'rg --files',
        \ 'options': '--multi',
        \ 'down': '30%'
        \}))
endfunction
command! -nargs=* FilesRg call s:files_rg()
