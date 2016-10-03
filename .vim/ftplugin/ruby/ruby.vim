" ruby specific configuration
"

nnoremap <buffer> <silent> \m :silent execute "normal! /\\v^\\s*def (self.)?".expand('<cword>').">\n"<cr>zz
nnoremap <buffer> <space>e :!ruby %<cr>

" run rspec file
nnoremap <buffer> <leader>ra :call RunAllSpecs()<cr>
nnoremap <buffer> <leader>rn :call RunNearestSpec()<cr>
nnoremap <buffer> <leader>rc :call RunCurrentSpecFile()<cr>

" nnoremap <buffer> <leader>er :edit %:p:h/spec/%:t:r_spec.rb<cr>
" nnoremap <buffer> <leader>es :edit %:p:h:h/%:t:r:s/_spec//.rb<cr>

syntax on
unlet b:current_syntax
syntax include @SQL syntax/sql.vim
syntax region sqlSnip matchgroup=Snip start=+<<-SQL.*$+ end=+^\s*SQL$+ contains=@SQL
hi link Snip SpecialComment
