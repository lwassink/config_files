" VIM Apearance
set number "turn on line numbering
set laststatus=2 "Make vim display the status line at all times
set term=ansi "turn on colors
set foldmethod=syntax "turn on code folding

" enhanced code highliting for python
let python_highlight_all = 1

" Statusline format
set statusline=Line\ %l/%-5L
set statusline+=Column\ %-4c
set statusline+=[File\ %.30f]\ [Type\ %Y]
set statusline+=%=
" Set status line coloring
hi StatusLine ctermbg=Black ctermfg=DarkGreen

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

" Allow me to jump back to a previous file
set hidden

" ctrlp settings
" max file limit
let g:ctrlp_max_files = 5000
" search from home directory
let g:ctrlp_working_path_mode = 'ra'
" ignore certain file types
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" TeX
let g:tex_flavors='latex' "prevent vim from assuming plaintex
autocmd BufNewFile,Bufread *.tex set filetype=tex "set it to load vimlatex for TeX files
let g:Tex_FoldedEnvironments='verbatim,comment,eq,gather,align,align*,figure,table,thebibliography, keywords,abstract,titlepage,frame' "set which TeX environments to fold

" NERDTree settings
" open with Ctrl+n
noremap <C-n> :NERDTreeToggle<CR>
" open automatically if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Load the Vundle configuration stuff
source ~/.vim/my_config_files/vundle_config

" turn on automatic comment insertion
setlocal formatoptions+=c formatoptions+=r formatoptions+=o


" +++++++++++++++++++++++KEY BINDINGS+++++++++++++++++++++++
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

" allow switching between split windows
noremap <C-J> <C_W><C-J>
noremap <C-K> <C_W><C-K>
noremap <C-L> <C_W><C-L>
noremap <C-H> <C_W><C-H>

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

" allow me to easily edit and reload my .vimrc file
noremap <leader>ev :split $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" backspace to begining of line in insert mode
" and on new line in normal mode
inoremap <leader><leader> <esc>cc
noremap <leader>o o<esc>0Di

" save more easily
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>

" reindent the whole document
noremap <leader>= gg=GGzz

" operator mappings
" select next paren pair
onoremap in( :<c-u>execute "normal! /(\rvi("<cr>
" select last paren pair
onoremap il( :<c-u>execute! "normal! /)\rvi("<cr>
" select last brace pair
onoremap in{ :<c-u>execute! "normal! /{\rvi("<cr>
" select last brace pair
onoremap il{ :<c-u>execute! "normal! /{\rvi("<cr>


" +++++++++++++++++++++++MY ABREVIATIONS+++++++++++++++++++++++
" automatic substitutions while in insert mode

" correct common spelling mistakes
iabbrev teh the
iabbrev waht what
iabbrev tehn then
iabbrev adn and
iabbrev lenght length

" for inserting in section headers in this .vimrc file
iabbrev +++ +++++++++++++++++++++++


" ++++++++++++++++++++++++MY AUTOCOMANDS++++++++++++++++++++++++
" events vim is supposed to respond to

" coment out line
augroup coment_line
autocmd FileType ruby nnoremap <buffer> <localleader>c I#<Space><esc>$
autocmd FileType python nnoremap <buffer> <localleader>c I#<Space><esc>$
autocmd FileType vim nnoremap <buffer> <localleader>c I"<Space><esc>$
augroup END
