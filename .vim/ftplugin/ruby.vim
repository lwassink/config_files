" ruby specific configuration
"

nnoremap <buffer> <leader>rs :call RunCurrentSpecFile()<CR>
nnoremap <buffer> <silent> \m :silent execute "normal! /\\v^\\s*def (self.)?".expand('<cword>').">\n"<cr>zz
nnoremap <buffer> <space>e :!ruby %<cr>

setlocal define=^\\s*def\\s*\\(self.\\)\\?
setlocal include=^\\s*require\\(_relative\\)\\?
