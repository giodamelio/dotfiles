" Copy and comment the current selection
function! s:copy_and_comment() abort
  " Get the positions of the selection
  let l:cursor_position = getpos('.')
  let l:visual_position = getpos('v')

  " Get the line numbers in order of [smaller, larger]
  " Lines are stored in the format [bufnum, lnum, col, off]
  if l:cursor_position[1] > l:visual_position[1]
    let l:lines = [l:visual_position, l:cursor_position]
  else
    let l:lines = [l:cursor_position, l:visual_position]
  endif

  " Get the lines of text
  let l:selected_text = getline(l:lines[0][1], l:lines[1][1])

  " Append a copy of the selected text after itself
  call append(l:lines[1][1], l:selected_text)

  " Comment out the selection
  call tcomment#Comment(l:lines[0][1], l:lines[1][1])

  " Exit visual mode
  " normal! <esc>
  " call feedkeys('\<esc>', 'n')

  " Set the cursor to the end of the copied text
  let l:selection_length = l:lines[1][1] - l:lines[0][1]
  let l:end_of_copy = copy(l:lines[1])
  let l:end_of_copy[1] += l:selection_length + 1
  call setpos('.', l:end_of_copy)
endfunction
command! CopyAndComment call s:copy_and_comment()
