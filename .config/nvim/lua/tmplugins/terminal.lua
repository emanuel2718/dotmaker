return {
  "numToStr/FTerm.nvim",
  keys = {
    { "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>', mode = "n", desc = "toggle floatterm" },
    { "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "toggle floatterm" },
  },
  config = function()
    require("FTerm").setup({
      border = "solid",
      blend = 10,
    })
  end,
  event = { "BufEnter" },
}