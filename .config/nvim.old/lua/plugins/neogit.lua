return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>g.", "<cmd>Neogit<cr>", opts)
    require('neogit').setup({})
  end
}
