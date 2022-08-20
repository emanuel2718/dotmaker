-- ONEDARK
-- require('onedark').setup {}
-- require('onedark').load()

-- TOKYONIGHT
-- vim.cmd[[colorscheme tokyonight]]

-- GRUVBOX
require("gruvbox").setup({
  undercurl = false,
  underline = false,
  bold = false,
  italic = false,
  strikethrough = false,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {},
})
vim.cmd("colorscheme gruvbox")

