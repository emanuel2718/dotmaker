local opt = vim.opt

-- vim.cmd.colorscheme "vanta"
-- vim.cmd.colorscheme "nord"
-- vim.cmd.colorscheme 'solarized'
-- vim.cmd.colorscheme "gruvbox"
-- vim.cmd.colorscheme('gruvbox-material')
-- vim.cmd.colorscheme('tokyonight-night')
-- vim.cmd.colorscheme('kanagawa-paper')
-- vim.cmd.colorscheme("classic-monokai")
-- vim.cmd.colorscheme("modus")
vim.cmd.colorscheme("lunaperche")

opt.number = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 8

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

opt.signcolumn = "yes"
opt.showmatch = true
opt.matchtime = 2
opt.synmaxcol = 300

opt.splitbelow = true
opt.splitright = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.showcmd = false
opt.showmode = false

opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.completeopt = "menu,menuone,noinsert,popup,fuzzy"

vim.opt.updatetime = 300 -- faster completion (defaults 4000)
vim.opt.timeoutlen = 500 -- key timeout duration
vim.opt.ttimeoutlen = 0  -- key timeout duration

opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- performance improvements question mark
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000


-- testing spell checkers
opt.spell = true
opt.spelllang = "en_us"
