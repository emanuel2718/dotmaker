filetype plugin indent on
syntax enable

set number
set ruler
set expandtab
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set splitright
set splitbelow
set nowritebackup
set noswapfile
set nobackup
set hlsearch

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader = " "
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

set rtp+=/usr/local/opt/fzf
