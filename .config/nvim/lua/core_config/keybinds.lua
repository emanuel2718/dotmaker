local keymap = vim.keymap.set

-- Space leader
vim.g.mapleader = " "

-- Telescope
keymap('n', '<leader>.', '<cmd>Telescope find_files hidden={true} <cr>') -- search files in cwd and beyond
keymap('n', '<leader>ff', '<cmd>Telescope find_files <cr>', { noremap = true, silent = true })
keymap('n', '<leader>fr', '<cmd>Telescope oldfiles <cr>')
keymap('n', '<leader>s.', '<cmd>Telescope grep_string <cr>') -- search for string under cursor
keymap('n', '<leader>si', '<cmd>Telescope lsp_document_symbols <cr>')
keymap('n', '<leader>sp', '<cmd>Telescope live_grep <cr>') -- search string in cwd
keymap('n', '<leader>pf', '<cmd>Telescope git_files <cr>') -- search files in project
keymap('n', '<leader>ss', '<cmd>Telescope current_buffer_fuzzy_find <cr>')
keymap('n', '<leader>sh', '<cmd>Telescope search_history <cr>')
keymap('n', '<leader>ht', "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>")

-- keymap('n', '<leader>ht', '<cmd> Telescope colorscheme <cr>')

keymap('n', '<leader>bf', '<cmd>Telescope buffers <cr>')
keymap('n', '<leader>bb', '<cmd>BufferLineCyclePrev<cr>')
keymap('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>')
keymap('n', '<leader>bc', '<cmd>BufferLinePickClose<cr>')
keymap('n', '<leader>vo', '<cmd>Telescope vim_options <cr>')
keymap('n', '<leader>ty', '<cmd>Telescope spell_suggest <cr>')
keymap('n', '<leader>rg', '<cmd>Telescope registers <cr>')
keymap('n', '<leader>cm', '<cmd>Telescope commands <cr>')
keymap('n', '<leader>ll', '<cmd>Telescope loclist <cr>')
-- keymap('n', '<leader>tt', '<cmd> Telescope help_tags <cr>')
keymap('n', '<leader>mp', '<cmd>Telescope man_pages <cr>')
keymap('n', '<leader>km', '<cmd>Telescope keymaps <cr>')
keymap('n', '<leader>sc', '<cmd>luafile% <cr>')
keymap('n', '<leader>cc', ':Z ')


keymap('n', '<leader>ps', '<cmd>PackerSync <cr>')
keymap('n', '<leader>pi', '<cmd>PackerInstall <cr>')

keymap('n', '<leader>gs', '<cmd>Telescope git_status <cr>')
keymap('n', '<leader>ga', '<cmd>Telescope git_branches <cr>')
keymap('n', '<leader>gl', '<cmd>Telescope git_commits <cr>')
keymap('n', '<leader>gbl', '<cmd>Telescope git_bcommits <cr>')
-- keymap('n', '<leader>ht',
--   function()
--     require('telescope.builtin').colorscheme({theme = 'dropdown', enable_preview = true})
--   end)

-- neovim specific keybinds
keymap('n', '<leader>nc', nvim_config)
-- keymap('n', '<leader>rr', '<cmd> so % <cr>')

-- Emacs window movement
keymap('n', '<leader>wh', '<C-w>h')
keymap('n', '<leader>wj', '<C-w>j')
keymap('n', '<leader>wk', '<C-w>k')
keymap('n', '<leader>wl', '<C-w>l')

-- toogle
-- comand


-- Split windows
keymap('n', '<leader>wv', ':vsplit<cr>')
keymap('n', '<leader>ws', ':split<cr>')

-- nvimTree
keymap('n', '<leader>e', '<cmd>NvimTreeToggle <cr>')
-- keymap('n', '<leader>bb', '<cmd> NvimTreeToggle <cr>')
keymap('n', '<leader>br', '<cmd>NvimTreeRefresh <cr>')

--- Git
-- lazygit
keymap('n', '<leader>gg', '<cmd> LazyGit <cr>')
-- keymap('n', '<leader>gg', '<cmd>Neogit<cr>')
-- keymap('n', '<leader>gj', "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>")
-- keymap('n', '<leader>gp', "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>")
keymap('n', '<leader>gl', "<cmd>lua require 'gitsigns'.blame_line()<cr>")
keymap('n', '<leader>gp', "<cmd>lua require 'gitsigns'.preview_hunk()<cr>")
keymap('n', '<leader>gr', "<cmd>lua require 'gitsigns'.reset_hunk()<cr>")
keymap('n', '<leader>gs', "<cmd>lua require 'gitsigns'.stage_hunk()<cr>")
keymap('n', '<leader>gd', "<cmd>Gitsigns diffthis HEAD<cr>")

-- Github Copilot
keymap('n', '<leader>g.', "<cmd>Copilot enable<cr>")
keymap('n', '<leader>gk', "<cmd>Copilot disable<cr>")



-- defaults
keymap('n', '<leader>wd', '<cmd>q<cr>', { silent = true })
keymap('n', '<leader>q', '<cmd>qa!<cr>')
keymap('n', '<leader>fs', '<cmd> w<cr>')
keymap('n', '<leader>`', '<cmd> b#<cr>', { silent = true }) -- switch to last buffer
keymap('n', '<F2>', '<cmd> vertical resize +7 <cr>')
keymap('n', '<F3>', '<cmd> vertical resize -7 <cr>')
keymap('n', '=', '<cmd> resize +1 <cr>')
keymap('n', '-', '<cmd> resize -1 <cr>')
keymap('n', '<leader><leader>', '<cmd> noh <cr>', { silent = true })
--keymap('n', '<Leader>nc', nvim_config)


-- Buffer managment
-- nmap <leader>d :bprevious<CR>:bdelete #<CR>
-- keymap('n', '<leader>bd', '<cmd> bprevious<cr> <cmd> bdelete #<cr>', { silent = true })
keymap('n', '<leader>bd', '<cmd>BufDel<cr>', { silent = true })



-- Press Esc twice to switch to normal mode in terminal
vim.cmd(':tnoremap <Esc><Esc> <C-\\><C-n>')


-- LSP binds
keymap('n', '<leader>lc', '<cmd> LspRestart <cr>')
keymap('n', '<leader>lj', vim.diagnostic.goto_next)
keymap('n', '<leader>lk', vim.diagnostic.goto_prev)
keymap('n', 'gD', '<cmd> lua vim.lsp.buf.declaration() <cr>')
keymap('n', 'gd', '<cmd> lua vim.lsp.buf.definition() <cr>')
keymap('n', 'K', '<cmd> lua vim.lsp.buf.hover() <cr>')
keymap('n', 'gi', '<cmd> lua vim.lsp.buf.implementation() <cr>')

keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
keymap('n', '<leader>wf', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
keymap('n', '<leader>i', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

-- LSP diagnostics
keymap('n', '<Leader>dd', '<cmd> ToggleDiag <cr>')
keymap('n', '<leader>du', '<Plug>(toggle-lsp-diag-underline)')
keymap('n', '<leader>ds', '<Plug>(toggle-lsp-diag-signs)')
keymap('n', '<leader>dv', '<Plug>(toggle-lsp-diag-vtext)')
keymap('n', '<leader>di', '<Plug>(toggle-lsp-diag-update_in_insert)')


-- Cargo commands
keymap('n', '<leader>cb', '<cmd> !cargo build <cr>')
keymap('n', '<leader>ct', '<cmd> !cargo test <cr>')
keymap('n', '<leader>cr', '<cmd> !cargo run <cr>')

-- Fold cycle
keymap('n', '<tab>', function() return require('fold-cycle').open() end, { silent = true })
keymap('n', '<s-tab>', function() return require('fold-cycle').close_all() end, { remap = true, silent = true })


-- indent magic
-- keymap("v", "<", ">gv")
-- keymap("v", ">", "<gv")
-- keymap('v', '>', '<cmd> >gv<cr>')
-- keymap('v', '<', '<cmd> <gv<cr>')
