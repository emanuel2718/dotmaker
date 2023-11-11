return {
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
}
