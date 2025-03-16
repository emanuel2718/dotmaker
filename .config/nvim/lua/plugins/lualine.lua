return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons", opts = {} },
  config = function()
    require("lualine").setup {
      -- theme = "tokyonight"
    }
  end,
}
