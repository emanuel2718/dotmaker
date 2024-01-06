return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    local icons = require("rami.icons")
    require('neogit').setup({
      auto_refresh = false,
      signs = {
        -- { CLOSED, OPENED }
        section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
        item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
        hunk = { "", "" },
      },
      integrations = {
        diffview = true,
        fzf_lua = true
      },
    })
  end
}