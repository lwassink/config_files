" PREAMBLE {{{
" anything that other stuff later on might depend on

" refer to ',' using <leader> at the begining of commands
" this gives greater flexibility with commands
let mapleader = ","
let maplocalleader = ","

" }}}


" VUNDLE {{{

" need this for vundle
set nocompatible

" turn this off now, but turn it on again after vundle is done
filetype plugin indent off
syntax off

" set the path for vundle
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle
call vundle#begin()

" list of plugins goes here
" format: Plugin 'repository/plugin_name'
" required plugin
Plugin 'VundleVim/Vundle.vim'

" my plugins
" file browser
Plugin 'https://github.com/scrooloose/nerdtree.git'
" template manager
Plugin 'git://github.com/aperezdc/vim-template.git'
" syntax checker
Plugin 'https://github.com/scrooloose/syntastic.git'
" code completion
Plugin 'https://github.com/Shougo/neocomplete.vim.git'
" apperently we need this plugin to use neocomplete
Plugin 'https://github.com/Konfekt/FastFold.git'
" run rspec unit tests from vim
Plugin 'https://github.com/thoughtbot/vim-rspec.git'

" to install a plugin, add it to the list and run :PluginInstall
" to update the plugins run :PluginUpdate
" to delete a plugin remove it from the list and run :PluginClean

" this does something. it has to come after the list of plugins
call vundle#end()

" now it's safe to turn that stuff from earlier back on
filetype plugin indent on
syntax on
" We also couldn't have this till after nocompatible was set
" show a comand as I type it
set showcmd

" }}}


" APPEARANCE {{{

set number " turn on line numbering
set laststatus=2 " Make vim display the status line at all times
if &ft != 'vim' " when filetype=vim we use marker based folding instead
  set foldmethod=syntax " turn on syntax based folding
endif
set foldlevel=100


" color options
highlight LineNr ctermfg=237 ctermbg=223
highlight Folded ctermbg=223 ctermfg=darkblue
highlight ErrorMsg ctermfg=red ctermbg=NONE

" custom highlight groups
highlight SearchResult ctermbg=011 ctermfg=black

" Set the cursor not to go to the very edge or bottom of the screen
set scrolloff=1
set sidescrolloff=5

" Statusline format
set statusline=\ %.40f
set statusline+=\ %y
set statusline+=%=
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%m
set statusline+=\ %l/%-5L

" set tabbing and indenting to be right for programing
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

" let me know when a line passes 81 characters
highlight ColorColumn ctermbg=113
call matchadd('ColorColumn', '\%81v', 100)

" show unwanted whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"}}}


" EDITING {{{

" keep buffers even while they're not displayed
set hidden

set whichwrap=<,>,h,l,[,]
set backspace=eol,start,indent
set hlsearch
nnoremap <leader>h :nohlsearch<cr>

" set % to match <> in addition to other parens
set matchpairs+=<:>

" turn on automatic comment insertion
setlocal formatoptions+=c formatoptions+=r formatoptions+=o

" turn on tab completion from the comand line
set wildmenu
set wildmode=longest,full

" backspace to begining of line in insert mode
" and on new line in normal mode
inoremap <leader><leader> <esc>cc
noremap <leader>o o<esc>0Di

" operator mappings
" select next paren pair
onoremap in( :<c-u>execute "normal! /(\rvi("<cr>
" select last paren pair
onoremap il( :<c-u>execute "normal! ?)\rvi("<cr>
" select next brace pair
onoremap in{ :<c-u>execute "normal! /{\rvi("<cr>
" select last brace pair
onoremap il{ :<c-u>execute "normal! ?}\rvi("<cr>

" trim trailing whitespace
fun! TrimWhitespace()
  let l:save_cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', l:save_cursor)
endfun

" use a key combo to trim trailing whitespace
noremap ,tw :call TrimWhitespace()<cr>

" capitalize most recent word
inoremap <c-u> <esc>viwUea
noremap <c-u> viwUe

" reindent the whole document
noremap <leader>= m'gg=G`'zz

" blink the next search
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('SearchResult', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

" }}}


" PLUGIN SETTINGS {{{

" NERDTree settings
" open with Ctrl+n
noremap <C-n> :NERDTreeToggle<CR>
" open automatically if no file is specified
augroup NERDtree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists(" s:std_in") | NERDTree | endif
augroup END

" vim-template settings
let g:email = 'lwassink@gmail.com'
let g:username = 'Luke Wassink'

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" syntastic maps
nnoremap <space>c :lclose<cr>
nnoremap <silent> <space>o :Errors<cr>
nnoremap <silent> <space>r :SyntasticReset<cr>

" neocomplete settings
" disable the builtin autocomplete, AutoComplPop
let g:acp_enableAtStartup = 0
" use neocomplete
let g:neocomplete#enable_at_startup = 1
" use smartcase
let g:neocomplet#enable_smart_case = 1
" set minimum keyword length
let g:neocomplete#syntax#min_keyword_length = 3
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><c-l>     neocomplete#complete_common_string()

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" }}}


" MAPS {{{
" My custom key maps

" general mappings
inoremap jk <Esc>
nnoremap U :redo<cr>
nnoremap s msHk's
noremap <leader>q :q<cr>

" split control commands
" these allow me to move to the windows above, below, to the left, and to the
" right, as well as to close a window or all other windows and shrink or
" enlarge the current window
noremap <leader>wk <c-w>k
noremap <leader>wj <c-w>j
noremap <leader>wh <c-w><left>
noremap <leader>wl <c-w><right>
noremap <leader>ww <c-w><c-w>
noremap <leader>wo <c-w>o
noremap <leader>wc <c-w>c
noremap <leader>wb <c-w>10>
noremap <leader>ws <c-w>10<

" put cursor between matching parens after typing them
" inoremap () ()<esc>i
" inoremap [] []<esc>i
" inoremap {} {}<esc>i
" inoremap <> <><esc>i
" inoremap '' ''<esc>i

" more easily edit and reload my .vimrc file
noremap <leader>ev :split $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" easily edit a template
noremap ,et :split ~/.vim/bundle/vim-template/templates/=template=.

" swap commands to make it easier for me to do common stuff
nnoremap ; :
nnoremap : ;
nnoremap v <c-v>
nnoremap <c-v> v
vnoremap v <c-v>
vnoremap <c-v> v
nnoremap 0 ^
nnoremap ^ 0

" }}}


" MY ABREVIATIONS {{{
" automatic substitutions while in insert mode

" correct common spelling mistakes
iabbrev teh the
iabbrev waht what
iabbrev tehn then
iabbrev adn and
iabbrev lenght length

" }}}


" GENERAL AUTOCOMANDS {{{
" events vim is supposed to respond to

" comment out line
augroup coment_line
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <localleader>c m'I#<Space><esc>`'
  autocmd FileType python nnoremap <buffer> <localleader>c m'I#<Space><esc>`'
  autocmd FileType vim nnoremap <buffer> <localleader>c m'I"<Space><esc>`'
  autocmd FileType css noremap <buffer> <localleader>c m'I/*<space><esc>A<space>*/<esc>`'
augroup END

" }}}


" LANGUAGE SPECIFIC SETTINGS {{{

" TeX
filetype plugin on
let g:tex_flavors='latex' " prevent vim from assuming plaintex
augroup TeX
  autocmd!
  autocmd BufNewFile,Bufread *.tex set filetype=tex " set it to load vimlatex for TeX files
augroup END
let g:Tex_FoldedEnvironments='verbatim,comment,eq,gather,align,align*,figure,table,thebibliography, keywords,abstract,titlepage,frame' " set which TeX environments to fold

" vimscript
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" ruby
augroup filetype_ruby
  autocmd!
  autocmd Filetype ruby noremap <leader>rs :call RunCurrentSpecFile()<CR>
augroup END

" }}}
