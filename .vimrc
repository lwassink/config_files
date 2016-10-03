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
set ttyfast

" save and close this vimrc when closing its window
augroup vimrc_commands
  autocmd!
  autocmd BufWinLeave *.vimrc mark z | write
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
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
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
" git integration
Plugin 'https://github.com/tpope/vim-fugitive.git'
" allow creation of custom text objects
Plugin 'https://github.com/kana/vim-textobj-user.git'
" a ruby block text object
Plugin 'https://github.com/nelstrom/vim-textobj-rubyblock.git'
" a plugin to insert 'end' in ruby
Plugin 'https://github.com/tpope/vim-endwise.git'
" do searching with ack (I actually use ag)
Plugin 'mileszs/ack.vim'
" easily switch two splits
Plugin 'https://github.com/wesQ3/vim-windowswap.git'
" visually move blocks of text
Plugin 'https://github.com/gavinbeatty/dragvisuals.vim.git'
" a nice file browser
Plugin 'https://github.com/scrooloose/nerdtree.git'
" fuzzy search
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
" visual undo tree
Plugin 'https://github.com/sjl/gundo.vim.git'
" align columns
Plugin 'https://github.com/godlygeek/tabular.git'
" auto-generate ctags
Plugin 'https://github.com/xolox/vim-easytags.git'
" required for easytags
Plugin 'https://github.com/xolox/vim-misc.git'
" rails support
Plugin 'tpope/vim-rails'
" make tab completion work
Plugin 'ervandew/supertab'

" to install a plugin, add it to the list and run :PluginInstall
" to update the plugins run :PluginUpdate
" to delete a plugin remove it from the list and run :PluginClean

" this does something. it has to come after the list of plugins
call vundle#end()

" now it's safe to turn that stuff from earlier back on
filetype plugin indent on
syntax on
" We also couldn't have this till after nocompatible was set

" }}}


" APPEARANCE {{{

set number
set laststatus=2 " Make vim display the status line at all times
" if &ft != 'vim' " when filetype=vim we use marker based folding instead
"   set foldmethod=syntax
" endif
set foldlevel=99
set showcmd
set showmode
set visualbell

" this vimrc file opens folded
augroup open_folded
  autocmd!
  autocmd Bufread *.vimrc set foldlevel=0
augroup END

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
highlight String ctermbg=none ctermfg=022

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
set softtabstop=2
set smarttab
set expandtab

" let me know when a line passes 81 characters
highlight ColorColumn ctermbg=cyan
function! s:ColorColumnEighty()
  if &ft =~# 'text'
    return
  else
    call matchadd('ColorColumn', '\%81v', 100)
  endif
endfunction
augroup check_80_lines
  autocmd!
  autocmd BufRead * call s:ColorColumnEighty()
augroup END

" show unwanted white space
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

set title titlestring= 

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

" set % to match <> in addition to other parens
set matchpairs+=<:>

" turn on automatic comment insertion
setlocal formatoptions+=c formatoptions+=r formatoptions+=o

" turn on tab completion from the command line
set wildmenu
set wildmode=longest,full

" tell filename completion which files to ignore
set wildignore+=*.o,*.out
set wildignore+=*.bmp,*.gif,*.ico,*.png,*.jpg,*.pdf
set wildignore+=.DS_Store,*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*~,*.swp,*.tmp
set wildignore+=*/tmp/*,*.so,*.zip,*.tar

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

" capitalize most recent word
inoremap <c-u> <esc>viw~ea
noremap <c-u> viw~e

" reformat the whole document
noremap <silent> <leader>= m'gg=G`'zz

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

" use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" save undos in a centralized location
set undodir=~/.vim/undo

" }}}


" PLUGIN SETTINGS {{{

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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

" Allow more general matching with %
packadd! matchit

" ultisnips settings
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="horizontal"

" vim-ruby-doc
let g:ruby_doc_command='open'
nnoremap \d :RubyDoc <cword><cr>

"visual-drag
vmap <expr> <left> DVB_Drag('left')
vmap <expr> <right> DVB_Drag('right')
vmap <expr> <up> DVB_Drag('up')
vmap <expr> <down> DVB_Drag('down')

" ctrlp
if executable('ag')
  let g:ctrlp_user_command = 'ag --path-to-agignore ~/.agignore %s -l --nocolor -g ""'
endif
let g:ctrp_map = '<c-p>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 0
let g:ctrlp_cmd = 'CtrlP'

" Gundo
nnoremap <leader>gu :GundoToggle<cr>

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-l>"

" }}}


" MAPS {{{
" My custom key maps

" general mappings
inoremap jk <Esc>
nnoremap U :redo<cr>
nnoremap <leader>l :ls<cr>:b<space>
nnoremap ,= m'gg=G`'
nnoremap ,tw :call TrimWhitespace()<cr>
nnoremap ,h :nohlsearch<cr>
nnoremap Y y$
nnoremap U :redo<cr>
nnoremap sb :b#<cr>
nnoremap sw <c-w>W
nnoremap \ ,
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>a
nnoremap dl 0<c-v>$d
nnoremap <space>j a<space><esc>h
nnoremap <space>k i<space><esc>l
nnoremap =p VypVr=
nnoremap <leader>nt :NERDTree<cr>
nnoremap ZZ :wall<cr>ZZ

" add closing brace, comma, etc.
inoremap (( ()<esc>i
inoremap "" ""<esc>i

" split control commands
" these allow me to move to the splits above, below, to the left, and to the
" right, as well as to close a split or all other splits and shrink or
" enlarge the current split
nnoremap <c-k>  <c-w>k
nnoremap <c-j>  <c-w>j
nnoremap <c-h>  <c-w>h
nnoremap <c-l>  <c-w>l
nnoremap <c-c> <c-w>c
nnoremap <c-,>  <c-w>10>
nnoremap <c-.>  <c-w>10<
nnoremap [w <c-w>W
nnoremap ]w <c-w>w

" edit and source commands
noremap <leader>ev :split $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eu :UltiSnipsEdit<cr>
" edit the template corresponding to current file extension
noremap <silent> <leader>et :execute 'split ~/.vim/bundle/vim-template/templates/=template=.' . expand('%:e')<cr>
nnoremap <leader>ec :execute "split ~/.vim/ftplugin/".&filetype."/".&filetype.".vim"<cr>

" swap commands to make it easier for me to do common stuff
nnoremap v <c-v>
nnoremap <c-v> v
vnoremap v <c-v>
vnoremap <c-v> v
nnoremap 0 ^
nnoremap ^ 0
nnoremap ` '
nnoremap ' `

" syntastic commands
nnoremap <space>r :SyntasticReset<cr>
nnoremap <space>e :Errors<cr>
nnoremap <space>ts :SyntasticToggleMode<cr>

" }}}


" COMMANDS {{{
" custom ed commands

command! WQ wq
command! Wq wq
command! W w
command! Q q

" }}}


" ABBREVIATIONS {{{
" automatic substitutions while in insert mode

" correct common spelling mistakes
iabbrev teh the
iabbrev waht what
iabbrev tehn then
iabbrev adn and
iabbrev lenght length
iabbrev edn end

" }}}


" GENERAL AUTOCOMANDS {{{
" events vim is supposed to respond to

" restore the cursor to its previous position on opening file
augroup restore_cursor
  autocmd!
  autocmd BufReadPost * execute "silent! normal! `z"
  autocmd BufWinLeave * mark z
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
