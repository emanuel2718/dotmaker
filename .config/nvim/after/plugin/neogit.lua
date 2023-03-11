local neogit = require("neogit")
local map = vim.keymap.set

neogit.setup({
  use_magit_keybindings = true,
})

map('n', '<leader>gg', ':Neogit<CR>')
