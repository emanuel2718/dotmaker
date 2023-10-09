local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', 'Q', '<nop>', opts)

-- split windows
map('n', '<leader>n', ':split<cr>', opts)
map('n', '<leader>m', ':vsplit<cr>', opts)

-- close windows
map('n', '<leader>o', ':q<cr>', opts)

-- windows movement
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Window resizing
map('n', '<Up>', ':resize +2<cr>', opts)
map('n', '<Down>', ':resize -2<cr>', opts)
map('n', '<Left>', ':vertical resize +2<cr>', opts)
map('n', '<Right>', ':vertical resize -2<cr>', opts)

-- move highlighted lines up and down
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Multiple indent commands
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- respect system clipboard
map('v', '<leader>y', [["+y]], opts)
map('n', '<leader>y', [["+Y]], opts)

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts)

-- Make the dot command work as expected in visual mode
-- https://www.reddit.com/r/vim/comments/3y2mgt/
map("v", ".", "<cmd>norm .<cr>", opts)


-- General
map('n', '<leader>q', ':qa!<CR>', opts)
map('n', '<leader>fs', ':w<CR>', opts)
map('n', '<leader>`', ':b#<cr>', opts) -- switch to last buffer



--------------------------- PLUGINS ---------------------------

-- Lazy
map('n', '<leader>L', '<cmd>Lazy<cr>', opts)

-- Mason
map('n', '<leader>M', '<cmd>Mason<cr>', opts)

-- Neotree
map("n", "<C-n>", ":Neotree toggle<CR>", opts)

-- Toggle Diagnostics
map('n', '<leader>dd', '<cmd>ToggleDiag<cr>', opts)


-- Telescope
local telescope_builtin = require('telescope.builtin')
map('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>')
map("n", "<leader>.", telescope_builtin.find_files, opts)
map("n", "<leader>fr", telescope_builtin.oldfiles, opts)
map("n", "<leader>sp", telescope_builtin.live_grep, opts)
map("n", "<leader>b", telescope_builtin.buffers, opts)
map("n", "<leader>fh", telescope_builtin.help_tags, opts)
map('n', '<leader>ss', telescope_builtin.current_buffer_fuzzy_find, opts)
map('n', '<leader>ht', telescope_builtin.colorscheme, opts)
map('n', '<leader>si', telescope_builtin.lsp_document_symbols, opts)
map('n', '<leader>sI', telescope_builtin.lsp_workspace_symbols, opts)
map('n', '<leader>bb', ':Telescope buffers<CR>', opts)


-- Neogit
map('n', '<leader>g.', '<cmd>Neogit<cr>', opts)



