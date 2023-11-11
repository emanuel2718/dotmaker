return {
  {
    "kylechui/nvim-surround",
    event = "BufReadPre",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({ input = { insert_only = false } })
    end,
  },
  {
    "folke/flash.nvim",
    event = "BufReadPre",
    config = function()
      require("flash").setup({
        modes = {
          search = { enabled = false },
          char = { enabled = false },
        },
      })
    end,
    init = function()
      local map = require('utils.').map
      map({ 'n', 'o', 'x'}, 'H', function() require('flash').jump() end)
    end
  },
}
