-- stylua: ignore
-- if true then return {} end

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      terminal_colors = true,
      undercurl = false,
      underline = false,
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = false,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = false,   -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {
        SignColumn = { bg = "#1D2021" },
        IncSearch = { fg = "#504945", bg = "#ebdbb2" },
        Search = { bg = "#665c54" },
        StatusLine = { link = "lualine_c_normal" },
        FlashLabel = { link = "DiffDelete" },
        YankyPut = { bg = "#ebdbb2" },
        YankyYanked = { bg = "#ebdbb2" },
      },
      dim_inactive = false,
      transparent_mode = false,
    },
  },
}
