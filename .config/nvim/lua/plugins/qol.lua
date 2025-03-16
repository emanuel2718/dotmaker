return {
  { "tpope/vim-sleuth" },
  { "ntpeters/vim-better-whitespace" },
  {
    "emanuel2718/vanta.nvim",
    config = function()
      require("vanta").setup()
    end,
  },
}
