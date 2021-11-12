-- SPACE as leader
vim.g.mapleader = " "


-- Configuration
require('core_config.lsp')
require('core_config.keymaps')
require('core_config.plugins')
require('core_config.settings')
require('core_config.colorscheme')


-- Plugins
require('core_plugins.lightline')
require('core_plugins.autopairs')
require('core_plugins.nvimtree')
require('core_plugins.telescope')
