" spell checking
let spell_auto_type="all"
let spell_executable = "aspell"

" VIM Apearance
set noruler "turn off the ruler so I can see the statusline
set number "turn on line numbering
set laststatus=2 "Make vim display the status line at all times
set term=ansi "turn on colors
set foldmethod=syntax "turn on code folding

" python settings
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
filetype indent on
set tabstop=3
set shiftwidth=3
set expandtab

" set scrolling with arrow keys to wrap lines
set whichwrap=<,>,h,l,[,]

" allow backspace to go over line breaks and other stuff
set backspace=eol,start,indent

" Allow patern matching with special characters
set magic

" Allow me to jump back to a previous file
set hidden

" Key Mappings
imap ;; <Esc>

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
set grepprg=grep\ -nH\ $* "make grep work
let g:Tex_FoldedEnvironments='verbatim,comment,eq,gather,align,align*,figure,table,thebibliography, keywords,abstract,titlepage,frame' "set which TeX environments to fold

" NERDTree settings
" open with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" open automatically if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Load the Vundle configuration stuff
source ~/.vim/plugin/vundle_config

" Tab settings
" command to open a new tab
map <C-t> :tabnew<CR>

" allow switching between split windows
noremap <C-J> <C_W><C-J>
noremap <C-K> <C_W><C-K>
noremap <C-L> <C_W><C-L>
noremap <C-H> <C_W><C-H>
