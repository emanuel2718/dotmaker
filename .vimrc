set nocompatible
filetype off


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'emanuel2718/vanta.nvim', { 'as': 'vanta' }
Plug '~/git/vanta.nvim', { 'as': 'vanta' }

call plug#end()


filetype on
filetype indent on
filetype plugin on

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
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set t_Co=256
set termguicolors
set background=dark
set tabpagemax=1000

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

colorscheme vanta


let mapleader = " "
nnoremap <leader>w :w<cr>
nnoremap <leader>q :qa!<cr>
nnoremap <leader>o :q!<cr>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <leader>m :vs<cr>
nnoremap <leader>n :split<cr>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)


nnoremap <leader>. :FZF<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>g :Rg<CR>
