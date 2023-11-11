local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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
map('n', '<leader>q', ':qa!<cr>', opts)
map('n', '<leader>fs', ':w<cr>')
map('n', '<leader>`', ':b#<cr>', opts) -- switch to last buffer
map('n', '<leader>s.', ':source %<cr>')


--------------------------- PLUGINS ---------------------------

-- Telesccope
local telescope = require('telescope.builtin')
map('n', '<leader>.', telescope.find_files, opts)
map('n', '<leader>,', telescope.oldfiles, opts)
map('n', '<leader>ff', ':Telescope find_files hidden=true no_ignore=true<cr>', opts)
map('n', '<leader><leader>', telescope.buffers, opts)
map('n', '<leader>sp', telescope.live_grep, opts)
map('n', '<leader>ss', telescope.current_buffer_fuzzy_find, opts)
map('n', '<leader>ht', telescope.colorscheme, opts)
map('n', '<leader>hp', telescope.help_tags, opts)
map('n', '<leader>gs', telescope.git_status, opts)
map('n', '<leader>nm', ':Telescope node_modules<cr>', opts)
-- map('n', '<C-f>', ':Telescope file_browser<cr>', opts)

-- Neotree
map('n', '<C-n>', ":Neotree toggle<cr>", opts)



-- Neogit
map('n', '<leader>g.', ":Neogit<cr>", opts)
