local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.termguicolors = true -- enable 24-bit RGB colors

require('lazy').setup({
  root = vim.fn.stdpath("data") .. "/lazy",                 -- directory where plugins will be installed
  spec = { { import = 'plugins' } },
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
  defaults = { lazy = false, version = nil },
  install = { missing = true, colorscheme = { 'carbonfox', 'habamax' } },
  checker = { enabled = true, notify = false, frequency = 86400 },
  change_detection = { notify = false },
  performance = { cache = { enabled = true } },
  state = vim.fn.stdpath("state") .. "/lazy/state.json",
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
})
