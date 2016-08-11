"
" Copyright (C) 2016 Luke Wassink <lwassink@gmail.com>
"
" Distributed under terms of the MIT license.
"
" grep the word under the cursor
"

nnoremap <leader>a :set operatorfunc=<SID>SilverSearcherOperator<cr>g@
vnoremap <leader>a :<c-u>call <SID>SilverSearcherOperator(visualmode())<cr>

function! s:SilverSearcherOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char'
    execute "normal! `[v`]y"
  else
    return
  endif

  silent execute "Ack! " . shellescape(@@) . " ."
  copen

  let @@ = saved_unnamed_register
endfunction!

