return {
  "lewis6991/gitsigns.nvim",
  event = 'InsertEnter',
  config = function()
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set
    local gs = require('gitsigns')


    map("n", "]h", gs.next_hunk, opts)
    map("n", "[h", gs.prev_hunk, opts)
    map("n", "<leader>gb", function() gs.blame_line() end, opts)


    gs.setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "▎" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    })
  end
}
