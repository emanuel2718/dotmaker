vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- nodeenv versioning
-- vim.g.copilot_node_command = "$HOME/.nodenv/versions/16.15.0/bin/node"

-- nvm versioning
vim.g.copilot_node_command = "$HOME/.nvm/versions/node/v16.15.0/bin/node"

-- TODO: add keybind to not show copilot on comments
vim.api.nvim_set_keymap('i', '<C-p>', 'copilot#Accept()', { expr = true, silent = true })
