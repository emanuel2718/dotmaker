local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<leader>L', '<cmd>Lazy<cr>', opts)

require("lazy").setup {
  spec = LAZY_PLUGINS,
  install = {
    colorscheme = { "default" },
  },
  ui = {
    border = "rounded",
  },
  performance = { cache = { enabled = true } },
  change_detection = {
    enabled = true,
    notify = false,
  },
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrw",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
}