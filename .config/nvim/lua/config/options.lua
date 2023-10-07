local opt = vim.opt
local cmd = vim.cmd

cmd([[ filetype plugin indent on ]])
	
opt.number = true
opt.backspace = { "eol", "start", "indent" } -- allow backspacing over everything in insert mode
opt.fileencoding = "utf-8"                   -- the encoding written to a file
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.syntax = "enable"
opt.autoindent = true  -- auto indentation
opt.expandtab = true   -- convert tabs to spaces
opt.shiftwidth = 2     -- the number of spaces inserted for each indentation
opt.smartindent = true -- make indenting smarter
opt.softtabstop = 2    -- when hitting <BS>, pretend like a tab is removed, even if spaces
opt.tabstop = 2        -- insert 2 spaces for a tab
opt.shiftround = true  -- use multiple of shiftwidth when indenting with "<" and ">"
opt.wildignore = opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*" }
opt.hlsearch = true   -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true  -- smart case
opt.laststatus = 2    -- only the last window will always have a status line
opt.lazyredraw = true -- don"t update the display while executing macros
opt.list = true
-- You can also add "space" or "eol", but I feel it"s quite annoying
opt.listchars = {
  tab = "┊ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "×"
}
opt.cmdheight = 0 -- more space in the neovim command line for displaying messages
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.scrolloff = 18 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 3 -- minimal number of screen columns to keep to the left and right (horizontal) of the cursor if wrap is `false`
opt.splitbelow = true -- open new split below
opt.splitright = true -- open new split to the right
opt.wrap = false -- display a long line
opt.modifiable = true

opt.backup = false -- create a backup file
opt.swapfile = false -- creates a swapfile
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.completeopt = { "menu", "menuone", "preview", "noselect" } -- cmp
opt.shortmess = opt.shortmess + { c = true }
opt.showmode = false
opt.history = 100    -- keep 100 lines of history
opt.redrawtime = 1500
opt.timeoutlen = 250 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeoutlen = 10
opt.updatetime = 100 -- signify default updatetime 4000ms is not good for async update
opt.modifiable = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.errorbells = false
opt.fcs = "eob: " -- hide `~` char on empty line at the end of the buffer

-- Disable builtin plugins
local disabled_built_ins = { "2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw", "netrwPlugin",
  "netrwSettings", "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper",
  "spellfile_plugin", "vimball", "vimballPlugin", "zip", "zipPlugin", "tutor", "rplugin",
  "synmenu", "optwin", "compiler", "bugreport", "ftplugin" }

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end



vim.cmd.colorscheme("carbonfox")
