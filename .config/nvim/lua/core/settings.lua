vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.completeopt = 'menuone,noselect'
vim.opt.encoding = 'utf-8'
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent= true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 50
vim.opt.wildignore = "*.swp, *.bak, *.pyc, *.class"
-- vim.opt.wirtebackup = false
vim.opt.wrap = false

-- NEVER insert comment on newline
vim.cmd('autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o')
vim.cmd('command CDD cd %:p:h')

vim.cmd('autocmd BufWinEnter * setlocal modifiable')

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})



