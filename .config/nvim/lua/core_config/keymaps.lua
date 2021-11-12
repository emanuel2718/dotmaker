-- Source Neovim config
vim.api.nvim_set_keymap('n', '<leader>hr', ':source $MYVIMRC<CR>', { silent = false })
vim.api.nvim_set_keymap('n', '<leader>v', ':e $MYVIMRC<cr>', { silent = true })

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
vim.api.nvim_set_keymap('n', '<leader>np', ':set nopaste<CR>', { noremap = true, silent = true })


-- NOTE: broken
-- Replace all ocurrences of the word in the current file
--vim.api.nvim_set_keymap('n', '<leader>r', ':%s/\<<C-r><C-w>\>//g<Left><Left>', { noremap = true, silent = true })

-- Replace all ocurrences of the word in the current line
--vim.api.nvim_set_keymap('n', '<leader>rl', ':s/\<<C-r><C-w>\>//g<Left><Left>', { noremap = true, silent = true })


-- switch to last opened buffer
vim.api.nvim_set_keymap('n', '<leader>`', ':b#<CR>', { noremap = true, silent = true })

-- open nvim tree
--vim.api.nvim_set_keymap('n', '<Leader>o-', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Packer manager
vim.api.nvim_set_keymap('n', '<Leader>pc', ':PackerClean<CR>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pi', ':PackerInstall<CR>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pl', ':PackerLoad<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ps', ':PackerSync<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pu', ':PackerUpdate<CR>',   { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>.', ':Telescope find_files<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope oldfiles<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pf', ':Telescope git_files<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>o-', ':Telescope file_browser<CR>',     { noremap = true, silent = true })

-- Telescope (LSP)
vim.api.nvim_set_keymap('n', '<Leader>gr', ':Telescope lsp_references<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gi', ':Telescope lsp_implementation<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Telescope lsp_definitions<CR>',     { noremap = true, silent = true })


-- search string under cursor
vim.api.nvim_set_keymap('n', '<Leader>sw', ':Telescope grep_string<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s.', ':Telescope live_grep<CR>',     { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>ht', ':Telescope colorscheme<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bi', ':Telescope buffers<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope commands<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fq', ':Telescope quick_fix<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope git_status<CR>',     { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>fgf', ':Telescope git_files<CR>',     { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>fgc', ':Telescope git_commits<CR>',     { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>fgb', ':Telescope git_branches<CR>',     { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>fgt', ':Telescope git_stash<CR>',     { noremap = true, silent = true })
