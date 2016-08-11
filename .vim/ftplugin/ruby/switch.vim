
" easily switch between code files and spec files

source ~/.vim/plugin/utilities.vim

nnoremap <buffer> <leader>es :call <SID>Switch()<cr>

if exists("g:ruby_switch_loaded")
  finish
endif
let g:ruby_switch_loaded = 1

function! s:Switch()
  let path = expand('%:p:h')
  let super_path = expand('%:p:h:h')
  let file_name = expand('%:t:r')

  if file_name =~# '\v^.+_spec$'
    let file_name = matchstr(file_name, '\v^\zs.+\ze_spec$')
    call UtilitiesSwitchFile(super_path . '/' . file_name . '.rb', 'source code')
  else
    call UtilitiesSwitchFile(path . '/spec/' . file_name . '_spec.rb', 'spec')
  endif
endfunction!

