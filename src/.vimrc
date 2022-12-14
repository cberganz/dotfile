
"""""""""""""""""
"	INTERFACE	"
"""""""""""""""""

" With a map leader it's possible to do extra key combinations
let mapleader = "\<Space>"

" your mouse will work
set mouse=a

" set line number
set number

" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" search down into subfolders with :find
set path+=**

" Enable filetype plugins
filetype plugin on
filetype indent on

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Display all matching files when tab complete
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight current line
set cursorline

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" get red extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


""""""""""""""""""""""""
"	COLORS AND FONTS   "
""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""
"	TAB & INDENT   "
""""""""""""""""""""

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" auto tab when newline
set autoindent

"Help with tabs
set smartindent
set cindent


"""""""""""""""""
"	SHORTCUTS	"
"""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Escape from insert mode
inoremap jk <Esc>
inoremap kj <Esc>
inoremap JK <Esc>
inoremap KJ <Esc>

" move between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <leader>j mz:m+<cr>`z
nmap <leader>k mz:m-2<cr>`z
vmap <leader>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <leader>k :m'<-2<cr>`>my`<mzgv`yo`z

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Fast saving
nmap <leader>w :w!<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Key bindings
map <C-n> :NERDTreeToggle<CR>


"""""""""""""
" FUNCTIONS	"
"""""""""""""

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


"""""""""""""""
"	PLUGINS	  "
"""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'sirver/ultisnips'
Plug 'pbondoer/vim-42header'
Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'crusoexia/vim-monokai'
call plug#end()

" Change color scheme
colorscheme monokai

" auto load NERDTREE when starting vim with no file/folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close VIM if NERDTREE is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
