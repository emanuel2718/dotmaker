call plug#begin('~/.vim/plugged')

" Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set rtp+=~/.fzf
set nocompatible
set hidden
filetype off
syntax on



"  ----------
" |  SPLITS  |
"  ----------
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



"  --------------
" |  ESSENTIALS  |
"  --------------

autocmd FileType * set formatoptions-=cro
set autoindent
set clipboard=unnamedplus
set cmdheight=2
set encoding=utf8
set history=500
set hlsearch
set noerrorbells
set noshowmatch
set noswapfile
set nowritebackup
set path+=**
set ruler
set scrolloff=4
set showcmd
set smartindent
set updatetime=500
set wildmenu
set laststatus=1
set incsearch
set paste

let g:loaded_matchparen=1


"  --------
" |  TABS  |
"  --------

set shiftwidth=4
set showtabline=0
set softtabstop=4
set tabstop=4
set textwidth=79
set expandtab
set shiftround


"  ----------
" |  REMAPS  |
"  ----------

" leader = SPACE
let mapleader = " "

nnoremap <leader>fs :w<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>s :source %<cr>
nnoremap <leader>w :wq<cr>
xnoremap <leader>; :w !python3<cr>
nnoremap <leader><leader> <c-^>


" Replace all occurences of word in file
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Replace all occurences of word in current line
nnoremap <leader>c :s/\<<C-r><C-w>\>//g<Left><Left>


"  -------
" |  FZF  |
"  -------


" Buffer options for FZF
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

" Last buffer switcher
nnoremap <silent> <Leader>`        :b#<CR>

" Show current opened buffers
nnoremap <silent> <Leader>b        :Buffers<CR>

" Change the color scheme on the fly
nnoremap <silent> <Leader>ht       :Colors<CR>

" Search by marks
nnoremap <silent> <Leader><Enter>  :Marks<CR>

" Like swiper in emacs: Search by line
nnoremap <silent> <Leader>l        :Lines<CR> 

" Like projectile in emacs: Search in project directory (git root folder)
nnoremap <silent> <Leader>p        :FZF ~/git/<CR>

" Fuzzy search from ~/
nnoremap <silent> <Leader>o        :FZF ~<CR>

" Type the folder from where to start searching
nnoremap<Leader>O                  :Files ~/<C-r><Left>

" Current folder file search
nnoremap <silent> <expr> <Leader>. (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" Open GFiles using ctrl-p keybind. Only shows the git files
nnoremap <C-p>                     :GFiles<Cr>

" Opens git commits window
nnoremap<silent><leader>gc         :Commits<CR>

" Show the fzf window on the bottom
let g:fzf_layout = { 'down':  '40%'}


