" ruby specific configuration
"

nnoremap <buffer> <silent> \m :silent execute "normal! /\\v^\\s*def (self.)?".expand('<cword>').">\n"<cr>zz
nnoremap <buffer> <space>e :!ruby %<cr>

" run rspec file
nnoremap <buffer> <leader>ra :call RunAllSpecs()<cr>
nnoremap <buffer> <leader>rn :call RunNearestSpec()<cr>
nnoremap <buffer> <leader>rc :call RunCurrentSpecFile()<cr>

