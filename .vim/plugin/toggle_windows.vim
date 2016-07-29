" toggle the quickfix window

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quifix_return_to_window . " wincmd w"
  else
    let g:quifix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction

" toggle the list window

let g:list_is_open = 0

function! s:ListToggle()
  if g:list_is_open
    lclose
    let g:list_is_open = 0
    execute g:list_return_to_window . " wincmd w"
  else
    let g:list_return_to_window = winnr()
    lopen
    let g:list_is_open = 1
  endif
endfunction

" key mappings

nnoremap <space>q :call <SID>QuickfixToggle()<cr>
nnoremap <space>l :call <SID>ListToggle()<cr>

