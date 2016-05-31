" BEGIN VUNDLE ------------------------ {{{
" make vundle work:
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
" fuzzy file search
Plugin 'https://github.com/kien/ctrlp.vim.git'
" file browser
Plugin 'https://github.com/scrooloose/nerdtree.git'
" template manager
Plugin 'git://github.com/aperezdc/vim-template.git'
" syntax checker
Plugin 'https://github.com/scrooloose/syntastic.git'

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


" APPEARANCE AND BASIC EDDITING ------------------------ {{{

" VIM Apearance
set number " turn on line numbering
set laststatus=2 " Make vim display the status line at all times
set term=ansi " turn on colors
if &ft != 'vim' " when filetype=vim we use marker based folding instead
	set foldmethod=syntax " turn on syntax based folding
endif

" Set the cursor not to go to the very edge or bottom of the screen
set scrolloff=1
set sidescrolloff=5

" Statusline format
hi StatusLine ctermbg=Black ctermfg=DarkGreen
set statusline=\ %.20f
set statusline+=\ %y
set statusline+=%=
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%m
set statusline+=\ %l/%-5L

" set tabbing and indenting to be right for programing
set autoindent
set tabstop=3
set shiftwidth=3

" set scrolling with arrow keys to wrap lines
set whichwrap=<,>,h,l,[,]

" set % to match <> in addition to other parens
set matchpairs+=<:>

" allow backspace to go over line breaks and other stuff
set backspace=eol,start,indent

" turn on automatic comment insertion
setlocal formatoptions+=c formatoptions+=r formatoptions+=o

" turn on tab completion from the comand line
set wildmenu
set wildmode=longest,full

" set vim to open any file with the code folded as much as possible
set foldlevelstart=0
" }}}


" PLUGIN SETTINGS ------------------------ {{{

" ctrlp settings
" max file limit
let g:ctrlp_max_files = 5000
" search from home directory
let g:ctrlp_working_path_mode = 'ra'
" ignore certain file types
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

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
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}


" MY MAPS ------------------------ {{{
" My custom key maps

" refer to , using <leader> at the begining of commands
" this gives greater flexibility with commands - I can create tons of
" custom macros
let mapleader = ","
let maplocalleader = ","

" Key Mappings
inoremap ;; <Esc>

" command to open a new tab
noremap <C-t> :tabnew<CR>

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
inoremap () ()<esc>i
inoremap [] []<esc>i
inoremap {} {}<esc>i
inoremap <> <><esc>i
inoremap "" ""<esc>i
inoremap '' ''<esc>i

" capitalize most recent word
inoremap <c-u> <esc>viwUea
noremap <c-u> viwUe

" more easily edit and reload my .vimrc file
noremap <leader>ev :split $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" backspace to begining of line in insert mode
" and on new line in normal mode
inoremap <leader><leader> <esc>cc
noremap <leader>o o<esc>0Di

" quit more easily
noremap <leader>q :q<cr>

" easily edit a template
noremap ,et :split ~/.vim/bundle/vim-template/templates/=template=.

" reindent the whole document
noremap <leader>= gg=GGzz

" operator mappings
" select next paren pair
onoremap in( :<c-u>execute! "normal! /(\rvi("<cr>
" select last paren pair
onoremap il( :<c-u>execute! "normal! /)\rvi("<cr>
" select next brace pair
onoremap in{ :<c-u>execute! "normal! /{\rvi("<cr>
" select last brace pair
onoremap il{ :<c-u>execute! "normal! /}\rvi("<cr>
" }}}


" MY ABREVIATIONS ------------------------ {{{
" automatic substitutions while in insert mode

" correct common spelling mistakes
iabbrev teh the
iabbrev waht what
iabbrev tehn then
iabbrev adn and
iabbrev lenght length

" for inserting in section headers in this .vimrc file
iabbrev -- -----------------------
" }}}


" GENERAL AUTOCOMANDS ------------------------ {{{
" events vim is supposed to respond to

" comment out line
augroup coment_line
	autocmd!
	autocmd FileType ruby nnoremap <buffer> <localleader>c I#<Space><esc>$
	autocmd FileType python nnoremap <buffer> <localleader>c I#<Space><esc>$
	autocmd FileType vim nnoremap <buffer> <localleader>c I"<Space><esc>$
	autocmd FileType css noremap <buffer> <localleader>c I/*<space><esc>A<space>*/<esc>
augroup END
" }}}


" LANGUAGE SPECIFIC SETTINGS ----------------------- {{{

" TeX
filetype plugin on
let g:tex_flavors='latex' " prevent vim from assuming plaintex
augroup TeX
	autocmd BufNewFile,Bufread *.tex set filetype=tex " set it to load vimlatex for TeX files
augroup END
let g:Tex_FoldedEnvironments='verbatim,comment,eq,gather,align,align*,figure,table,thebibliography, keywords,abstract,titlepage,frame' " set which TeX environments to fold

" vimscript
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
