" Get the count of the ALE errors of the current buffer
function! CurrentBufferALEErrorsCount()
  let l:counts = ale#statusline#Count(bufnr(''))

  " Colors referenced from the lightline wombat theme directly
  let l:colors = {
        \'red': [
        \   g:lightline#colorscheme#wombat#palette.normal.error[0][3],
        \   g:lightline#colorscheme#wombat#palette.normal.error[0][1]
        \],
        \'green': [
        \   g:lightline#colorscheme#wombat#palette.insert.left[0][3],
        \   g:lightline#colorscheme#wombat#palette.insert.left[0][1],
        \],
        \'grey': [
        \   g:lightline#colorscheme#wombat#palette.visual.left[1][2],
        \   g:lightline#colorscheme#wombat#palette.visual.left[1][0],
        \]}
  let l:background = [
        \ g:lightline#colorscheme#wombat#palette.visual.left[1][3],
        \ g:lightline#colorscheme#wombat#palette.visual.left[1][1]
        \]

  if l:counts.total == 0
    let l:color = get(l:colors, 'green')
    let l:return_text = 'Ok'
  else
    let l:color = get(l:colors, 'red')
    let l:return_text = printf(
          \ '%d errors',
          \ l:counts.total
          \)
  endif

  " Display nothing if ALE hasn't linted this buffer
  if !get(b:, 'ale_linted', v:null)
    let l:color = get(l:colors, 'grey')
    let l:return_text = 'Not run'
  endif

  " Set the colors
  exe printf('highlight ALEErrorColor ctermfg=%d ctermbg=%d guifg=%s guibg=%s', color[0], l:background[0], color[1], l:background[1])

  return l:return_text
endfunction
