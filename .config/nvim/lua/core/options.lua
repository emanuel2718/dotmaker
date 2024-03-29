local opt = vim.opt
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

opt.breakindent = true
opt.backup = false
opt.cmdheight = 1
opt.completeopt = { "menuone", "noselect" }
opt.expandtab = true -- tabs -> spaces
opt.fcs = 'eob: ' -- hide `~` char on empty line at the end of the buffer
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "split"
opt.list = true
opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}
opt.fillchars = {
  eob = " ", -- Suppress ~ at EndOfBuffer
  fold = " ", -- Hide trailing folding characters
  diff = "╱",
  foldopen = "",
  foldclose = "",
}
opt.mouse = "a"
opt.number = true
-- opt.pumblend = 10
opt.pumheight = 10 -- pop up menu
opt.ruler = true
opt.scrolloff = 10
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append "c"
opt.showcmd = false
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes" -- don't shift
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2 -- two spaces per tab
opt.termguicolors = true
opt.title = false
opt.undofile = true
opt.updatetime = 250 -- faster completion (4000ms default)
opt.timeoutlen = 300
opt.wrap = false
opt.writebackup = false


-- vim.cmd('hi Normal guibg=black ctermbg=black')
