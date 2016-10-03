"
" g-d
" Copyright (C) 2016 Luke Wassink <lwassink@gmail.com>
"
" Distributed under terms of the MIT license.
"

if exists("g:g-d_loaded")
  finish
endif
let g:lists_loaded = 1

source ~/.vim/plugin/utilities.vim

function! s:Leader()
  if UtilitiesPreviousLine() =~# '\v^\s*$'
    if s:PreviousLeader() ==# 'G'
      return 'Me: '
    else
      return 'God: '
    endif
  endif
  return ''
endfunction

function! s:PreviousLeader()
  let lineno = line('.') - 2
  while (lineno > 0)

    if getline(lineno) ==# ''
      let nextl = getline(lineno + 1)
      if nextl =~# '\v^God:'
        return 'G'
      elseif nextl =~# '\v^Me:'
        return 'M'
      endif
    endif

    let lineno -= 1
  endwhile

  return 'G'
endfunction

function! s:PrintLeader()
  let register_contents = @a
  let @a = s:Leader()
  normal! "ap==
  let @a = register_contents
endfunction

imap <cr> <cr><esc>:call <SID>PrintLeader()<cr>A

