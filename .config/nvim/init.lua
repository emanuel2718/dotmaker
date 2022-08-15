local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'


if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require('core_config.plugins')
require('core_config.keybinds')
require('core_config.settings')
require('core_config.helpers')
require('core_config.colorscheme')


require('core_plugins.lsp-installer')
require('core_plugins.autopairs')
require('core_plugins.colorizer')
-- require('core_plugins.colour')
require('core_plugins.comment')
require('core_plugins.formatter')
require('core_plugins.gitsigns')
require('core_plugins.lazygit')
require('core_plugins.lualine')
require('core_plugins.nvim-tree')
require('core_plugins.telescope')
require('core_plugins.telescope-file-browser')
require('core_plugins.toogle-term')
require('core_plugins.toogle-lsp-diagnostics')
require('core_plugins.treesitter')


require('core_plugins.lsp.lsp-cmp')
require('core_plugins.lsp.lsp-config')






