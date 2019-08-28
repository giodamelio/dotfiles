" Signify next that wraps around
function! s:signify_hunk_next_wrap() abort
  let oldpos = getcurpos()
  call sy#jump#next_hunk(1)
  if getcurpos() == oldpos
    echo 'Signify wrapped'
    call sy#jump#prev_hunk(9999)
  endif
endfunction
command! SignifyHunkNextWrap call s:signify_hunk_next_wrap()

" Signify previous that wraps around
function! s:signify_hunk_prev_wrap() abort
  let oldpos = getcurpos()
  call sy#jump#prev_hunk(1)
  if getcurpos() == oldpos
    echo 'Signify wrapped'
    call sy#jump#next_hunk(9999)
  endif
endfunction
command! SignifyHunkPrevWrap call s:signify_hunk_prev_wrap()
