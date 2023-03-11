local map = vim.keymap.set

vim.g.gitblame_enabled = 0
map('n', '<leader>gl', ':GitBlameToggle<cr>')
