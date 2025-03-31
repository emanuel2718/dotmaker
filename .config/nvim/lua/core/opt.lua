-- vim.cmd.colorscheme "gruvbox"
-- vim.cmd.colorscheme "kanagawa"
vim.cmd.colorscheme "vanta"

local opt = vim.opt

opt.number = true
opt.cursorline = true
opt.wrap = false
opt.incsearch = true
opt.signcolumn = "yes"

opt.splitbelow = true
opt.splitright = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartcase = true

opt.undofile = true
opt.swapfile = false
opt.writebackup = false
opt.completeopt = "menu,menuone,noinsert,popup,fuzzy"
