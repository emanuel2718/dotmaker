vim.opt['background'] = 'dark'
vim.opt['relativenumber'] = true
vim.opt['ruler'] = true
vim.opt['numberwidth'] = 1
vim.opt['tabstop'] = 2
vim.opt['shiftwidth'] = 2
vim.opt['shiftround'] = true
vim.opt['expandtab'] = true
vim.opt['mouse'] = 'a'
vim.opt['foldlevel'] = 99
vim.opt['foldmethod'] = 'indent'
vim.opt['foldenable'] = true
vim.opt['smartindent'] = true
vim.opt['autoindent'] = true
vim.opt['termguicolors'] = true
vim.opt['hlsearch'] = true
vim.opt['encoding'] = 'utf-8'
vim.opt['fileencoding'] = 'utf-8'
vim.opt['showmode'] = false
vim.opt['clipboard'] = 'unnamedplus'
vim.opt['swapfile'] = false
vim.opt['laststatus'] = 3
vim.opt['splitbelow'] = true
vim.opt['splitright'] = true
vim.opt['textwidth'] = 79
vim.opt['wildmenu'] = true
vim.opt['writebackup'] = false
vim.opt['smartcase'] = true
vim.opt['errorbells'] = false
vim.opt['cindent'] = true
vim.opt['ignorecase'] = true
vim.opt['incsearch'] = true
vim.opt['wrap'] = false
vim.opt['scrolloff'] = 4
vim.opt['sidescrolloff'] = 4
vim.opt['wildignore'] = '*.swp, *.bak, *.pyc, *.class'


-- NEVER insert comment on newline
vim.cmd('autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o')
vim.cmd('command CDD cd %:p:h')


vim.opt['undofile'] = true
vim.opt['undodir'] = os.getenv('HOME')..'/.cache/nvim/undo'
vim.opt['undolevels'] = 1000
vim.opt['undoreload'] = 10000


