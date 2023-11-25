return {
  {
    "NvChad/nvim-colorizer.lua", -- Preview colors
    opts = {
      filetypes = { "*", "!packer", "!yaml" },
      user_default_options = {
        tailwind = "lsp",
        names = false,
        sass = { enable = true, parsers = { css = true } },
      },
    },
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
