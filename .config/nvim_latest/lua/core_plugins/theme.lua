---------------------- ONEDARK ----------------------
-- require('onedark').setup {}
-- require('onedark').load()

---------------------- TOKYONIGHT ----------------------
-- vim.cmd[[colorscheme tokyonight]]

---------------------- MATERIAL ----------------------
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


---------------------- GRUVBOX ----------------------
-- require("gruvbox").setup({
--   undercurl = false,
--   underline = false,
--   bold = false,
--   italic = false,
--   strikethrough = false,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   overrides = {},
-- })
-- vim.cmd("colorscheme gruvbox")

