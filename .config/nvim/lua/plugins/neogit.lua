return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    local map = require('rami.utils').map
    require('neogit').setup {
      auto_refresh = true,
      integrations = {
        diffview = true,
        fzf_lua = true
      }
    }

    map('n', '<leader>g.', '<cmd>Neogit<cr>')
  end
}

