" ruby specific configuration
"

nnoremap <buffer> <silent> \m :silent execute "normal! /\\v^\\s*def (self.)?".expand('<cword>').">\n"<cr>zz
nnoremap <buffer> <space>e :!ruby %<cr>

" run rspec file
nnoremap <leader>ra :call RunAllSpecs()<cr>
nnoremap <leader>rn :call RunNearestSpec()<cr>
nnoremap <leader>rc :call RunCurrentSpecFile()<cr>

