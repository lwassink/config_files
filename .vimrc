" PREAMBLE {{{
" anything that other stuff later on might depend on

" refer to ',' using <leader> at the beginning of commands
" this gives greater flexibility with commands
let mapleader = ","
let maplocalleader = ","

set history=500
set noignorecase
set t_Co=256
set sessionoptions+=resize

" save and close this vimrc when closing its window
augroup vimrc_commands
  autocmd!
  autocmd BufWinLeave *.vimrc write | bdelete
augroup END

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
" template manager
Plugin 'git://github.com/aperezdc/vim-template.git'
" syntax checker
Plugin 'https://github.com/scrooloose/syntastic.git'
" code completion
Plugin 'https://github.com/Shougo/neocomplete.vim.git'
" apparently we need this plugin to use neocomplete
Plugin 'https://github.com/Konfekt/FastFold.git'
" run rspec unit tests from vim
Plugin 'https://github.com/thoughtbot/vim-rspec.git'
" easier commenting
Plugin 'https://github.com/tpope/vim-commentary.git'
" ruby support
Plugin 'vim-ruby/vim-ruby'
" search for visual selection using *
Plugin 'bronson/vim-visual-star-search.git'
" instert interactive snippets
Plugin 'SirVer/ultisnips'
" repeat and undo mappings
Plugin 'https://github.com/tpope/vim-repeat.git'
" handy maps involving '[' and ']'
Plugin 'https://github.com/tpope/vim-unimpaired.git'
" easily modify surroundings of text
Plugin 'https://github.com/tpope/vim-surround.git'
" easily exchange blocks of text
Plugin 'https://github.com/tommcdo/vim-exchange.git'
" git integration
Plugin 'https://github.com/tpope/vim-fugitive.git'
" run programs from vim
Plugin 'https://github.com/tpope/vim-dispatch.git'
" allow creation of custom text objects
Plugin 'https://github.com/kana/vim-textobj-user.git'
" a ruby block text object
Plugin 'https://github.com/nelstrom/vim-textobj-rubyblock.git'

" to install a plugin, add it to the list and run :PluginInstall
" to update the plugins run :PluginUpdate
" to delete a plugin remove it from the list and run :PluginClean

" this does something. it has to come after the list of plugins
call vundle#end()

" now it's safe to turn that stuff from earlier back on
filetype plugin indent on
syntax on
" We also couldn't have this till after nocompatible was set
" show a command as I type it
set showcmd

" }}}


" APPEARANCE {{{

set number " turn on line numbering
set laststatus=2 " Make vim display the status line at all times
if &ft != 'vim' " when filetype=vim we use marker based folding instead
  set foldmethod=syntax " turn on syntax based folding
endif
set foldlevel=99

set formatoptions+=c " autowrap comments
set formatoptions+=r " automatically continue comments on next line
set formatoptions+=o " do the same with 'o' in normal mode
set formatoptions+=q " allow gq for comments
set formatoptions+=l " don't break lines while inserting
set formatoptions+=j " easier joining of comments


" color options
highlight StatusLineNC ctermbg=000 ctermfg=255 cterm=bold term=bold
highlight StatusLine ctermbg=223 ctermfg=000 cterm=none term=none
highlight Folded ctermbg=none ctermfg=darkblue
highlight ErrorMsg ctermfg=red ctermbg=NONE

" custom highlight groups
highlight SearchResult ctermbg=red ctermfg=white

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

" set tabbing and indenting to be right for programming
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

" let me know when a line passes 81 characters
highlight ColorColumn ctermbg=cyan
call matchadd('ColorColumn', '\%81v', 100)

" show unwanted white space
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

" save undo history
set undofile

" complete words with ctrl-n and ctrl-p
set complete+=kspell

" set % to match <> in addition to other parens
set matchpairs+=<:>

" turn on automatic comment insertion
setlocal formatoptions+=c formatoptions+=r formatoptions+=o

" turn on tab completion from the command line
set wildmenu
set wildmode=longest,full

" backspace to beginning of line in insert mode
" and on new line in normal mode
inoremap <leader><leader> <esc>cc
noremap <leader>o o<esc>0Di

" operator mappings
onoremap in( :<c-u>execute "normal! /(\rvi("<cr>
onoremap il( :<c-u>execute "normal! ?)\rvi("<cr>
onoremap in{ :<c-u>execute "normal! /{\rvi("<cr>
onoremap il{ :<c-u>execute "normal! ?}\rvi("<cr>
onoremap . f.
onoremap - f_
onoremap % VggG

" trim trailing white space
fun! TrimWhitespace()
  let l:save_cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', l:save_cursor)
endfun

" use a key combo to trim trailing white space
noremap ,tw :call TrimWhitespace()<cr>

" capitalize most recent word
inoremap <c-u> <esc>viw~ea
noremap <c-u> viw~e

" reindent the whole document
noremap <leader>= m'gg=G`'zz

" remove trailing white space from file
nnoremap <leader><space> ma:silent %s/\s\+$//<cr>:nohlsearch<cr>`a

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
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Allow more general matching with %
packadd! matchit

" ultisnips settings
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" }}}


" MAPS {{{
" My custom key maps

" general mappings
inoremap jk <Esc>
nnoremap U :redo<cr>
nnoremap s msHk's
noremap <leader>q :q<cr>
nnoremap <leader>l :ls<cr>:b<space>
nnoremap ,= m'gg=G`'
nnoremap ,tw :call TrimWhitespace()<cr>
nnoremap ,h :nohlsearch<cr>
nnoremap Y y$
nnoremap U :redo<cr>
nnoremap sb :b#<cr>
nnoremap \ ,
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>a
inoremap <c-j> i<c-j>

nnoremap [w <c-w>W
nnoremap ]w <c-w>w

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

" edit and source commands
noremap <leader>ev :split $MYVIMRC<cr>
noremap <leader>ov :edit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eu :UltiSnipsEdit<cr>

" easily edit a template
noremap ,et :split ~/.vim/bundle/vim-template/templates/=template=.

" swap commands to make it easier for me to do common stuff
nnoremap v <c-v>
nnoremap <c-v> v
vnoremap v <c-v>
vnoremap <c-v> v
nnoremap 0 ^
nnoremap ^ 0

" syntastic commands
nnoremap <space>r :SyntasticReset<cr>
nnoremap <space>e :Errors<cr>
nnoremap <space>ts :SyntasticToggleMode<cr>

" list navigation commands
nnoremap <space>lo :lopen<cr>
nnoremap <space>lc :lclose<cr>
nnoremap <space>co :copen<cr>
nnoremap <space>cc :cclose<cr>

" }}}


" ABBREVIATIONS {{{
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

" restore the cursor to its previous position on opening file
augroup restore_cursor
  autocmd!
  autocmd BufReadPost * execute "silent! normal! `z"
  autocmd BufWinLeave * execute "normal! mz"
augroup END

augroup save_when_focus_lost
  autocmd!
  autocmd FocusLost * :wall
augroup END

" }}}


" LANGUAGE SPECIFIC SETTINGS {{{

" TeX
let g:tex_flavors='latex' " prevent vim from assuming plaintex
augroup TeX
  autocmd!
  autocmd BufNewFile,Bufread *.tex set filetype=tex
augroup END
let g:Tex_FoldedEnvironments='verbatim,comment,eq,gather,align,align*,figure,table,thebibliography, keywords,abstract,titlepage,frame'
let g:Tex_CompileRule_pdf='/Library/TeX/texbin/lualatex'

" vimscript
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" git
augroup git_settings
  autocmd!
  autocmd BufReadPre .gitignore set filetype=git
  autocmd FileType git setlocal commentstring=#%s
augroup END

" vim help
augroup vim_help
  autocmd!
  autocmd FileType help nnoremap t <c-]>
augroup END

" ruby
augroup ruby
  autocmd!
  autocmd FileType ruby execute "normal! /^\s*private<cr>mp"
augroup END

" }}}


" EX-MODE SETTINGS {{{
" settings for the command line, and for ex-mode

" make cnext, cprev wrap
command! Cnext try | cnext | catch | silent! cfirst | endtry
command! Cprev try | cprev | catch | silent! clast | endtry

" make lnext, lprev wrap
command! Lnext try | lnext | catch | silent! lfirst | endtry
command! Lprev try | lprev | catch | silent! llast | endtry

" }}}
