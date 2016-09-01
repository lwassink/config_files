" my vim config files for shell scripting

if filereadable(expand('%'))
  autocmd BufNewFile *.sh execute expand("!chmod 755 %:p")
else
endif
inoremap <buffer> {{ {<cr>}<esc>O
nnoremap <buffer> <space><space> :!%:p<cr>
