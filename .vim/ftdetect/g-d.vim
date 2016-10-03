"
" g-d
" Copyright (C) 2016 Luke Wassink <lwassink@gmail.com>
"
" Distributed under terms of the MIT license.
"

augroup g_d_file_type
  autocmd!
  autocmd BufNewFile,Bufread *.g-d set filetype=g-d
augroup END

