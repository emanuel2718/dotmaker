-- Created by Emanuel Ramirez on 09/02/2021

-- Source Neovim config (TODO: not reloading the whole configuration. Research this)
vim.api.nvim_set_keymap('n', '<leader>hr', ':source $MYVIMRC<CR>', { silent = false })
vim.api.nvim_set_keymap('n', '<leader>v', ':e $MYVIMRC<cr>', { silent = true })

-- Edit nvim config files
-- vim.api.nvim_set_keymap('n', '<leader>nn', ':e $HOME/.config/nvim/init.lua<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>nk', ':e $HOME/.config/nvim/lua/core_config/keymaps.lua<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>np', ':e $HOME/.config/nvim/lua/core_config/plugins.lua<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ns', ':e $HOME/.config/nvim/lua/core_config/settings.lua<cr>', { silent = true })


-- EXPERIMENTAL
-- Search dotfiles in dotmaker
vim.api.nvim_set_keymap('n', '<leader>nn', ':lua require("core_plugins.telescope").search_dotmaker()<CR>', { silent = true })

-- vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})

-- Vim window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':bdelete<CR>', { silent = true })


-- Emacs window movement
vim.api.nvim_set_keymap('n', '<leader>wh', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wl', '<C-w>l', { silent = true })

-- Split windows
vim.api.nvim_set_keymap('n', '<Leader>wv', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ws', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wd', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wo', ':only<CR>', { noremap = true, silent = true })

-- defaults
vim.api.nvim_set_keymap('n', '<leader>q', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fs', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yp', ':set paste<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>kp', ':set nopaste<CR>', { noremap = true, silent = true })

-- Highlight wizard
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>ggVG', { noremap = true, silent = true })

-- Git
vim.api.nvim_set_keymap('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Commentator
vim.api.nvim_set_keymap('n', '<C-c><C-C>', ':CommentToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c><C-C>', ':CommentToggle<CR>', { noremap = true, silent = true })

-- switch to last opened buffer
vim.api.nvim_set_keymap('n', '<leader>`', ':b#<CR>', { noremap = true, silent = true })

-- open nvim tree
vim.api.nvim_set_keymap('n', '<Leader>o-', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Packer manager
vim.api.nvim_set_keymap('n', '<Leader>pc', ':PackerClean<CR>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pi', ':PackerInstall<CR>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pl', ':PackerLoad<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ps', ':PackerSync<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pu', ':PackerUpdate<CR>',   { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>.', ':Telescope find_files<CR>',     { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files({hidden=true})<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope oldfiles<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pf', ':Telescope git_files<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ss', ':Telescope current_buffer_fuzzy_find<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sw', ':Telescope grep_string<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s.', ':Telescope live_grep<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ht', ':Telescope colorscheme<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bi', ':Telescope buffers<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope commands<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fq', ':Telescope quick_fix<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope git_status<CR>',     { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>o-', ':Telescope file_browser<CR>',     { noremap = true, silent = true })

-- Telescope (LSP)
vim.api.nvim_set_keymap('n', '<Leader>gr', ':Telescope lsp_references<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gi', ':Telescope lsp_implementation<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Telescope lsp_definitions<CR>',     { noremap = true, silent = true })
