"
" god
" Copyright (C) 2016 Luke Wassink <lwassink@gmail.com>
"
" Distributed under terms of the MIT license.
"

augroup god_file_type
  autocmd!
  autocmd BufNewFile,Bufread *.god set filetype=god
augroup END

