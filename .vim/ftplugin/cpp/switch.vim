
" easily switch between .cpp and .h files

source ~/.vim/plugin/utilities.vim

nnoremap <buffer> <leader>es :call <SID>Switch()<cr>

if exists("g:cpp_switch_loaded")
  finish
endif
let g:cpp_switch_loaded = 1

function! s:Switch()
  let extension = expand('%:e')
  let file_name = expand('%:p:r')

  if extension ==# 'h'
    call UtilitiesSwitchFile(file_name . '.cpp', 'C++ code')
  elseif extension ==# 'cpp'
    call UtilitiesSwitchFile(file_name . '.h', 'header')
  else
    echom "To use Switch() you must have extension .h or .cpp"
  endif
endfunction

