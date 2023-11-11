local opt = vim.opt
local cmd = vim.cmd

cmd([[ filetype plugin indent on ]])

opt.number = true
opt.relativenumber = true

opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftround = true  -- use multiple of shiftwidth when indenting with "<" and ">"

opt.modifiable = true

opt.hidden = true -- Buffer switching without saving
opt.termguicolors = true

opt.incsearch = true
opt.hlsearch = true

opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- But sensitive if includes capital letter
opt.grepprg = 'rg --ignore-case --vimgrep'
opt.signcolumn = "yes"
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.lazyredraw = true  -- don"t update the display while executing macros

opt.list = true
opt.listchars = {
  tab = "┊ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "×"
}
opt.cmdheight = 0     -- more space in the neovim command line for displaying messages
opt.mouse = "a"       -- allow the mouse to be used in neovim
opt.splitbelow = true -- open new split below
opt.splitright = true -- open new split to the right
opt.wrap = false      -- display a long line

opt.backup = false                                             -- create a backup file
opt.swapfile = false                                           -- creates a swapfile
opt.writebackup = false                                        -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.completeopt = { "menu", "menuone", "preview", "noselect" } -- cmp
opt.showmode = false
opt.history = 100 -- keep 100 lines of history
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.errorbells = false
opt.fcs = "eob: " -- hide `~` char on empty line at the end of the buffer

opt.path = '**'
opt.wildignore = {
  '**/node_modules/**',
  '**/coverage/**',
  '**/.idea/**',
  '**/.git/**',
  '**/.nuxt/**',
}

opt.scrolloff = 5
opt.sidescrolloff = 5

-- Folds
opt.foldcolumn = '0'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldtext = 'v:lua.vim.treesitter.foldtext()'




-- cmd.colorscheme('habamax')
vim.g.gruvbox_material_background = "hard"
cmd.colorscheme("gruvbox-material")

