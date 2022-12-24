local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader as <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


--------- Default keymaps ---------

-- Emacs window movement
keymap('n', '<leader>wh', '<C-w>h', { desc = 'Move to Left Window'})
keymap('n', '<leader>wj', '<C-w>j', { desc = 'Move to Bottom Window'})
keymap('n', '<leader>wk', '<C-w>k', { desc = 'Move to Top Window'})
keymap('n', '<leader>wl', '<C-w>l', { desc = 'Move to Right Window'})

-- Split windows
keymap('n', '<leader>wv', ':vsplit<cr>', { desc = '[W]indow [V]ertical Split'})
keymap('n', '<leader>ws', ':split<cr>', { desc = '[W]indow [S]plit'})

keymap('n', '<leader>wd', '<cmd>q<cr>', { silent = true, desc = '[W]indow [D]elete' })
keymap('n', '<leader>qq', '<cmd>qa!<cr>', { silent = true, desc = '[Q]uit [Q]uit' })
keymap('n', '<leader>fs', '<cmd>w<cr>', { silent = true, desc = '[F]ile [S]ave' })
keymap('n', '<leader>`', '<cmd>b#<cr>', { silent = true, desc = 'Switch to last buffer'}) -- switch to last buffer
-- keymap('n', '=', '<cmd>resize +1<cr>') -- resize up
-- keymap('n', '-', '<cmd>resize -1<cr>') -- resize down
keymap('n', '<leader><leader>', '<cmd> noh <cr>', { silent = true, desc = 'Clear Highlights' })


-- <Space> do nothing on normal mode and visual mode
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = 'Do nothing' })

-- deal with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move highlighted lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- move line up and keep cursor position
keymap("n", "J", "mzJ`z")

-- <C-d> and <C-u> scroll but keep cursor in the middle
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")


-- keep cursor in the middle when searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")



-- respect system clipboard unless told otherwise
keymap({ 'n', 'v' }, '<leader>y', [["+y]])
keymap({'n', 'v'}, '<leader>Y', [["+Y]])

-- Q, don't be doing  random shit, please
keymap("n", "Q", "<nop>")

-- Move record macro to Q
keymap("n", "Q", "q", opts)
keymap("n", "q", "<Nop>", opts)


-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Is this the projectile replacement i was looking for?
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


-- Quickfix navigation
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = 'Next Quickfix' })
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = 'Previous Quickfix' })
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = 'Next Location' })
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = 'Previous Location' })

-- Search and replace for current word
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace word under cursor' })

-- Cargo commands
keymap('n', '<leader>cb', '<cmd>!cargo build<cr>', { desc = '[C]argo [B]uild' })
keymap('n', '<leader>ct', '<cmd>!cargo test<cr>', { desc = '[C]argo [T]est' })
keymap('n', '<leader>cr', '<cmd>!cargo run<cr>', { desc = '[C]argo [R]un' })





--------- Plugin keymaps ---------

-- NvimTree
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = '[E]xplorer Toogle' })
keymap('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = '[E]xplorer [R]efresh' })

-- Git Neogit
keymap('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Git'}) -- neogit


-- Github Copilot
keymap('n', '<leader>g.', "<cmd>Copilot enable<cr>", { desc = 'Enable Github Copilot' })
keymap('n', '<leader>gk', "<cmd>Copilot disable<cr>", { desc = 'Disable Github Copilot' })


-- UndoTree
keymap('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = '[U]ndo Tree Toogle' })

-- Packer
keymap('n', '<leader>ps', '<cmd>PackerSync <cr>', { desc = '[P]acker [S]ync' })
keymap('n', '<leader>pi', '<cmd>PackerInstall <cr>', { desc = '[P]acker [I]nstall' })

-- Gitsigns
keymap('n', '<leader>gl', "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = '[G]it [L]ine Blame' })



-- Telescope
local builtin = require('telescope.builtin')
keymap('n', '<leader>pf', builtin.git_files, { desc = '[P]roject [F]iles' })
keymap('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ile [R]ecent' })
keymap('n', '<leader>.', builtin.find_files, { desc = '[F]ile [.] Find' })
keymap('n', '<leader>s.', builtin.grep_string, { desc = '[S]earch [.] String' })
keymap('n', '<leader>sp', builtin.live_grep, { desc = '[S]earch [P]attern' })
keymap('n', '<leader>ss', builtin.current_buffer_fuzzy_find, { desc = '[S]earch [S]tring' })
-- keymap('n', '<leader>/', builtin.current_buffer_fuzzy_find(theme.get_dropdown { winblend = 10, peviewer = false }))
keymap('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap('n', '<leader>ht', "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", { desc = "[H]elp [T]heme" })
keymap('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })


-- Zen mode
keymap('n', '<leader>zz', require('zen-mode').toggle, { desc = '[Z]en mode' })



-- LSP
-- local keymap = function(keys, func, desc)
--   if desc then
--     desc = 'LSP: ' .. desc
--   end
--   keymap('n', keys, func, {desc})
-- end
keymap('n', '<leader>lc', '<cmd>LspRestart <cr>', { desc = 'LSP Restart' })
keymap('n', '<Leader>dd', '<cmd>ToggleDiag <cr>', { desc = 'Toogle Diagnostics' })
keymap('n', 'dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
keymap('n', 'dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
keymap('n', '<leader>i', vim.diagnostic.open_float, { desc = 'Open float diagnostic' })
keymap('n', '<leader>ll', vim.diagnostic.setloclist, { desc = 'Open location list' })
keymap('n', '<leader>rr', vim.lsp.buf.rename, { desc = 'LSP Rename' })
keymap('n', '<leader>f', vim.lsp.buf.format, { desc = 'LSP Format' })
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })
keymap('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'LSP Go To Definition' })
keymap('n', '<leader>gD', vim.lsp.buf.declaration, { desc = 'LSP Go To Declaration' })
keymap('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'LSP Go To Implementation' })
keymap('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'LSP Type Definition' })
keymap('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
keymap('n', '<C-K>', vim.lsp.buf.signature_help, { desc = 'LSP Signature Help' })
keymap('n', '<leader>gr', builtin.lsp_references, { desc = 'LSP References' })
keymap('n', '<leader>si', builtin.lsp_document_symbols, { desc = 'LSP Document Symbols' })
keymap('n', '<leader>sw', builtin.lsp_dynamic_workspace_symbols, { desc = 'LSP Workspace Symbols' })

keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'LSP Add Workspace Folder' })
keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'LSP Remove Workspace Folder' })
