"pathogen plugin
execute pathogen#infect()
" Encoding
set encoding=utf-8

"disable compatibility mode with vi"
set nocompatible

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase
" Show line numbers
set number
"show file stats"
set ruler

"Whitespace"
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

set laststatus=2

syntax on
filetype plugin indent on

map <silent> <C-n> :NERDTreeToggle<CR>
