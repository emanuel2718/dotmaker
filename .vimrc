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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'

"Plug 'emanuel2718/vanta.nvim', { 'as': 'vanta' }
"Plug '~/git/vanta.nvim', { 'as': 'vanta' }

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
"set signcolumn=yes
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
set laststatus=2
set updatetime=300
set background=dark
set tabpagemax=1000

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let mapleader = " "
nnoremap <leader>w :w<cr>
nnoremap <leader>q :qa!<cr>
nnoremap <leader>o :q!<cr>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <leader>m :vs<cr>
nnoremap <leader>n :split<cr>

" Yank to system clipboard only
vnoremap <leader>y "+y
nnoremap <leader>y ""+yy

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

nnoremap <leader>. :FZF<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>sp :Rg<CR>

" lsp
nnoremap <leader>k :coc-diagnostic-prev<CR>
nnoremap <leader>j :coc-diagnostic-next<CR>

nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)
nmap <leader>gn <Plug>(coc-rename)
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)
xmap <C-.>  <Plug>(coc-codeaction-selected)
nmap <C-.>  <Plug>(coc-codeaction-selected)

nnoremap <silent><nowait> <space>i  :<C-u>CocList outline<cr>

inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <silent> K :call ShowDocumentation()<cr>

command! -nargs=0 Format :call CocActionAsync('format')


let g:coc_global_extensions = [
  \ 'coc-rust-analyzer',
  \ 'coc-tsserver',
  \ 'coc-html'
  \ ]

" autosource .vimrc when saving
autocmd BufWritePost *.vim source $MYVIMRC

let g:lightline = {
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ }
  \ }


