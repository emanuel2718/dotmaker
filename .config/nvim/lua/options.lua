local opt = vim.opt

vim.cmd("autocmd!")

opt.number = true
opt.relativenumber = true

opt.autoindent = true
opt.smartindent = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

opt.lazyredraw = true

opt.backup = false
opt.writebackup = false
opt.signcolumn = 'yes'
opt.completeopt = { 'menuone', 'noselect' }

opt.swapfile = false

opt.showcmd = false
opt.cmdheight = 1

opt.mouse = "a"

opt.hlsearch = false

opt.wrap = false

opt.cursorline = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.timeoutlen = 800

opt.textwidth = 79

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.splitbelow = true
opt.splitright = true

opt.joinspaces = false

opt.errorbells = false

opt.termguicolors = true

opt.updatetime = 350

opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

opt.laststatus = 2

--opt.winblend = 0
-- opt.wildoptions = "pum"
-- opt.pumblend = 5
opt.background = "dark"

opt.fileencoding = "utf-8"

opt.list = true
opt.listchars = {
  tab = "»·",
  trail = "·",
  extends = "↪",
  precedes = "↩",
}

opt.shada = {
  "!", -- When included, save and restore global variables that start
  -- with an uppercase letter, and don't contain a lowercase
  -- letter.  Thus "KEEPTHIS and "K_L_M" are stored, but "KeepThis"
  -- and "_K_L_M" are not.  Nested List and Dict items may not be
  -- read back correctly, you end up with an empty item.
  "'1000",
  -- Maximum number of previously edited files for which the marks
  -- are remembered.  This parameter must always be included when
  -- 'shada' is non-empty.
  -- Including this item also means that the |jumplist| and the
  -- |changelist| are stored in the shada file.
  "<50", -- Maximum number of lines saved for each register.  If zero then
  -- registers are not saved.  When not included, all lines are
  "s100",
  -- Maximum size of an item contents in KiB.
  "h", -- Disable the effect of 'hlsearch' when loading the shada
  -- file. When not included, it depends on whether ":nohlsearch"
}
-- If you exit Vim and later start it again, you would normally lose a lot of
-- information.  The ShaDa file can be used to remember that information, which
-- enables you to continue where you left off.  Its name is the abbreviation of
-- SHAred DAta because it is used for sharing data between Neovim sessions.
--
-- This is introduced in section |21.3| of the user manual.
--
-- The ShaDa file is used to store:
-- - The command line history.
-- - The search string history.
-- - The input-line history.
-- - Contents of non-empty registers.
-- - Marks for several files.
-- - File marks, pointing to locations in files.
-- - Last search/substitute pattern (for 'n' and '&').
-- - The buffer list.
-- - Global variables.




-- NEVER insert comment on newline
vim.api.nvim_create_autocmd("FileType", {
  command = "setlocal formatoptions-=cro",
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 100
    })
  end
})


-- globals that were not being set for some reason
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.gitblame_enabled = 0
