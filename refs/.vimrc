set nocompatible
filetype off

filetype plugin indent on

" some defaults
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

silent !mkdir -p ~/.vim/tmp/undo
set undodir=~/.vim/tmp/undo//
silent !mkdir -p ~/.vim/tmp/backup
set backupdir=~/.vim/tmp/backup//
silent !mkdir -p ~/.vim/tmp/swap
set directory=~/.vim/tmp/swap//
set backup
set noswapfile

" Don't try to highlight long lines
set synmaxcol=500

" remap leader
let mapleader = ","

" wildignore
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store

" tame search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" save shortcut
nnoremap <leader>s :w<cr>

" quit shortcut
nnoremap <leader>q :q<cr>

" add a new line but don't switch to insert mode
map <s-enter> O<esc>j
" map <cr> o<esc>k

" wrapping
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1

" disable keys for learning 'proper' vim movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" colon command shortcut
nnoremap ; :

" save on losing focus
au FocusLost * :wa

" reselect pasted content
nnoremap <leader>v V`]

" faster escape
inoremap jj <ESC>

" split screen niceties
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" set font size
:set guifont=Menlo:h14

" ack leader shortcut
nnoremap <leader>a :Ack<space>

" highlight trailing whitespace
match Todo /\s\+$/

fun! StripTrailingWhitespace()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
  let @/=_s
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call StripTrailingWhitespace()

nnoremap <leader>cw :call StripTrailingWhitespace()<cr>

" quick open - CtrlP
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = '<leader>,'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }

let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/|docs/build/" .
    \ ")'"

let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files | " .
    \ ctrlp_filter_greps

let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]

nnoremap <leader>. :CtrlPTag<cr>

