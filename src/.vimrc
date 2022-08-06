" your mouse will work
set mouse=a
" highlights as you type search string
set incsearch
" auto tab when newline
set autoindent
" Syntax colours
syntax on
" set line number
set number
" ignorecase when searching
set ignorecase
"highlights matches when searching
set showmatch
"highlight current line
set cursorline
"set tab to match ecole42
set tabstop=4
set shiftwidth=4
set softtabstop=4
"@DaiClement whitespace trick
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"Help with tabs
set smartindent
set cindent

"Help file related settings
" search down into subfolders with :find just use wildcard operator !!
set path+=**
" Display all matching files when tab complete
set wildmenu

" Key bindings
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeMapActivateNode='h'
let NERDTreeMapOpenSplit='h'

noremap k j
noremap i k
noremap j h

inoremap <C-j> <Left>
inoremap <C-k> <Down>
inoremap <C-i> <Up>
inoremap <C-l> <Right>

noremap h i

inoremap jk <Esc>
inoremap kj <Esc>

noremap <C-j> <C-w>h
noremap <C-k> <C-w>j
noremap <C-i> <C-w>k
noremap <C-l> <C-w>l

" auto load NERDTREE when starting vim with no file/folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close VIM if NERDTREE is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
