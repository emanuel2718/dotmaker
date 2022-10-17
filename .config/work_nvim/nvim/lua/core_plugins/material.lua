-- Material Theme config
vim.g.material_style = 'deep ocean'

require('material').setup({
	contrast = {
		-- sidebars = true,
		floating_windows = true,
    non_current_windows = true,
	},
	italics = {
		keywords = false,
		functions = false,
	},
	contrast_filetypes = {
		'terminal',
		'packer',
		'qf',
	},
	disable = {
		borders = false,
		eob_lines = false 
	},
  lualine_style = "default", -- `stealth` or `default`
  async_loading = true,
})
vim.cmd 'colorscheme material'

vim.cmd("highlight WinSeparator guifg=#c0bfbc")
