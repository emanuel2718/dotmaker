return {
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      -- Fonts
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.g.gruvbox_material_enable_italic = 0
      vim.g.gruvbox_material_enable_bold = 0
      vim.g.gruvbox_material_transparent_background = 1
      -- Themes
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high" -- The contrast of line numbers, indent lines, etc.
      vim.g.gruvbox_material_float_style = "dim"  -- Background of floating windows
    end,
  },
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "main",
    priority = 1000,
  },
  {
    'behemothbucket/dirty-ice-theme.nvim',
    config = function()
      require('dirty-ice').setup()
    end
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        styles = {
          comments = { italic = false },
        },
      })
    end,
  },
}
