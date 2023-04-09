-- vim options
local opt = vim.opt

opt.relativenumber = true
opt.shiftwidth = 2

opt.autoindent = true
opt.smartindent = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

opt.lazyredraw = true

opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.signcolumn = "yes"
opt.completeopt = { "menuone", "noselect" }

opt.wrap = false
opt.whichwrap = "b,s" -- don't go back using `h`

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.errorbells = false
opt.clipboard = ""

opt.list = true

opt.listchars = {
  tab = "»·",
  trail = "·",
  extends = "↪",
  precedes = "↩",
}


-- NEVER insert comment on a new line
vim.api.nvim_create_autocmd("FileType", {
  command = "setlocal formatoptions-=cro",
})
