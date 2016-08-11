" Auto generate lists in text documents

if exists("b:lists_loaded")
  finish
endif
let b:lists_loaded = 1

function! s:PreviousLine()
  if line('.') ==# 1
    return '###'
  else
    return getline(line('.') - 1)
  endif
endfunction!


function! s:Leader()
  let prev_line = s:PreviousLine()

  if prev_line =~# '\v^\s*--'
    return '-- '
  elseif prev_line =~# '\v^\s*\d+[.\)]\s*[^ ]'
    let number = matchstr(prev_line, '\v\d+')
    let number += 1
    let symbol = matchstr(prev_line, '\v[\.\)]')
    return string(number) . symbol . ' '
  else
    return ''
  endif
endfunction!

function! s:PrintLeader()
  let register_contents = @a
  let @a = s:Leader()
  normal! "ap==
  let @a = register_contents
endfunction!

imap <buffer> <cr> <cr><esc>:call <SID>PrintLeader()<cr>A
nmap <buffer> o o<esc>:call <SID>PrintLeader()<cr>A

