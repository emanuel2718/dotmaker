local M = {
 "neanias/everforest-nvim",
 version = false,
 lazy = false,
 priority = 1000,
}

function M.config()
 require("everforest").setup({
  background = "soft",
  transparent_background_level = 2,
  italics = false,
  disable_italic_comments = true,
  sign_column_background = "none",
  ui_contrast = "high",
  dim_inactive_windows = true,
  diagnostic_text_highlight = false,
  diagnostic_virtual_text = "coloured",
  diagnostic_line_highlight = false,
  spell_foreground = false,
  show_eob = true,
 })
 vim.cmd.colorscheme("everforest")
end

return M