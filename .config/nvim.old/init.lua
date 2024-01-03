vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local modules = { "lazy", "autocmds", "keymaps", "options", "theme" }
for _, mod in ipairs(modules) do
  require("config." .. mod)
end
