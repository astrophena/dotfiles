set nocompatible

set backspace=indent,eol,start

set modelines=0

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=70
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
match RedundantSpaces /\s\+\%#\@<!$/

set number
set scrolloff=5
set hidden

set nobackup
set noswapfile

set viminfo=

set modeline

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_dirhistmax=0

set pastetoggle=<F2>

set laststatus=1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugins')
Plug 'mattn/vim-goimports', { 'for': 'go' }
call plug#end()
