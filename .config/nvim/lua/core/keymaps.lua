local map = vim.keymap.set
-- local builtin = require('telescope.builtin')

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

-- movement, but center me after
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
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

-- turn the word under cursor to UPPER case
map("i", "<c-u>", "<Esc>viwUea")

-- Turn the current word into Title case
map("i", "<c-t>", "<Esc>b~lea")

-- ref: https://stackoverflow.com/a/1346777/6064933
-- paste below the current line
map("n", "<leader>p", "m`o<ESC>p``")

-- paste above the current line
map("n", "<leader>P", "m`O<ESC>p``")

-- map("n", "<leader>en", function()
--   builtin.find_files { cwd = vim.fn.stdpath "config" }
-- end)

-- map("n", "<leader>en", function()
--   builtin.find_files { cwd = vim.fn.stdpath "config" }
-- end)


-- map("n", "<leader>el", "<cmd>e $MYVIMRC <bar> tcd %:h<cr>", {
--   silent = true,
--   desc = "open init.lua",
-- })

-- Change current working directory locally and print cwd after that,
-- see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
-- map("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd", { desc = "change cwd" })
-- map("n", "<leader>cd", function()
--   vim.ui.input({ prompt = "Change cwd to: ", default = vim.fn.expand("%:p:h") }, function(input)
--     if input and #input > 0 then
--       vim.cmd("lcd " .. input)
--       print(vim.fn.getcwd())
--     end
--   end)
-- end, { desc = "change cwd" })

map("n", "<leader>cd", function()
  local start = vim.fn.expand("%:p:h")
  local cwd = vim.fn.input("Change cwd to: ", start, "dir")
  if cwd ~= nil and cwd ~= "" then
    vim.cmd("lcd " .. cwd)
    print(vim.fn.getcwd())
  end
end, { desc = "change cwd with path completion" })

-- NOTE: is not supported with lazyvim
-- map("n", "<leader>sl", function()
--   vim.cmd([[
--       update $MYVIMRC
--       source $MYVIMRC
--     ]])
-- end, {
--   silent = true,
--   desc = "reload init.lua",
-- })


-- Toggle spell checking
map("n", "<F11>", "<cmd>set spell!<cr>")
map("i", "<F11>", "<c-o><cmd>set spell!<cr>")

-- Toggle cursor column


map("n", "<Esc>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<Esc>"
  end
end, { expr = true })
