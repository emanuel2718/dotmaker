local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- split windows
map("n", "<leader>n", ":split<cr>", opts)
map("n", "<leader>m", ":vsplit<cr>", opts)

-- close windows
map("n", "<leader>o", ":q<cr>", opts)

-- windows movement
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window resizing
map("n", "<Up>", ":resize +2<cr>", opts)
map("n", "<Down>", ":resize -2<cr>", opts)
map("n", "<Left>", ":vertical resize +2<cr>", opts)
map("n", "<Right>", ":vertical resize -2<cr>", opts)

-- move highlighted lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Multiple indent commands
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- respect system clipboard
map("v", "<leader>y", [["+y]], opts)
map("n", "<leader>y", [["+Y]], opts)

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts)

-- Make the dot command work as expected in visual mode
-- https://www.reddit.com/r/vim/comments/3y2mgt/
map("v", ".", "<cmd>norm .<cr>", opts)

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- General
map("n", "<leader>q", ":qa!<cr>", opts)
map("n", "<leader>fs", ":w!<cr>")
map("n", "<leader>`", ":e #<cr>", opts)
map("n", "<leader>s.", ":source %<cr>")
map("n", "<C-f>", ":e ")
