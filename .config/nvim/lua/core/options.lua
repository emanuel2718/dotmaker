local opt = vim.opt

-- vim.cmd.colorscheme "vanta"
-- vim.cmd.colorscheme "nord"
-- vim.cmd.colorscheme 'solarized'
vim.cmd.colorscheme "gruvbox"
-- vim.cmd.colorscheme('gruvbox-material')
-- vim.cmd.colorscheme('tokyonight-night')
-- vim.cmd.colorscheme('kanagawa-paper')
-- vim.cmd.colorscheme("classic-monokai")
-- vim.cmd.colorscheme("modus")

opt.number = true
opt.rnu = false
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

opt.showcmd = false
opt.showmode = false

opt.undofile = true
opt.swapfile = false
opt.writebackup = false
opt.completeopt = "menu,menuone,noinsert,popup,fuzzy"
