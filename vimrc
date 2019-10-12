set nocompatible

set backspace=indent,eol,start

set modelines=0

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=78
set fo=crq
set autoindent

set ruler
set nowrap

set laststatus=2
set encoding=utf-8

set showmatch
set showcmd

set wildmode=list:longest,full

set incsearch
set infercase
set ignorecase
set smartcase
set hlsearch

set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<

filetype plugin on
filetype indent on

syntax enable

if !has('win32unix')
  set background=dark
  set t_Co=256
  colorscheme elflord
endif

highlight clear SignColumn
highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

set number
set scrolloff=5
set hidden

set nobackup
set noswapfile

set viminfo=

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_dirhistmax=0

set pastetoggle=<F2>
