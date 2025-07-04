vim.g.mapleader = " "
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({ import = "plugins" }, {
  change_detection = {
    notify = false,
  },
})

local modules = { "options", "keymaps", "autocmds" }
for _, mod in ipairs(modules) do
  require("core." .. mod)
end
