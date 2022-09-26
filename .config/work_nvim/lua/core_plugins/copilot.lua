
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_node_command = "~/.nodenv/versions/16.15.0/bin/node"

-- TODO: add keybind to not show copilot on comments
vim.api.nvim_set_keymap('i', '<C-p>', 'copilot#Accept()', { expr = true, silent = true})
