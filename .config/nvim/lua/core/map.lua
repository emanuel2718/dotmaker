local map = vim.keymap.set

-- split
map("n", "<leader>n", "<cmd>split<cr>")
map("n", "<leader>m", "<cmd>vsplit<cr>")

-- movement
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-h>", "<c-w><c-h>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- resize
map("n", "<Left>", "<c-w>5<")
map("n", "<Right>", "<c-w>5>")
map("n", "<Up>", "<C-W>+")
map("n", "<Down>", "<C-W>-")

-- move highlighted lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Multiple indent commands
map("v", "<", "<gv")
map("v", ">", ">gv")

-- respect system clipboard
map("v", "<leader>y", [["+y]])
map("n", "<leader>y", [["+Y]])

-- quit
map("n", "<leader>q", "<cmd>qa!<cr>")

-- save
map("n", "<leader>w", "<cmd>w!<cr>")

-- close buffer
map("n", "<leader>o", "<cmd>q<cr>")

-- last buffer
map("n", "<leader>`", "<cmd>e #<cr>")

-- send nvim to the foreground
map("n", "<C-g>", "<C-z>")

-- highlight every line in the buffer
map("n", "<leader>a", "VggoG")

-- source current lua file
map("n", "<leader>x", "<cmd>source %<CR>")

-- don't yank pasted over text
map("v", "p", '"_dP')

map("n", "<Esc>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<Esc>"
  end
end, { expr = true })
