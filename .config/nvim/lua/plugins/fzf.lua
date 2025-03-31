return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf = require "fzf-lua"
    fzf.setup {
      winopts = {
        --   hidden = "hidden",
        -- },
        height = 0.5,
        width = 1,
        row = 1,
        col = 0.5,
        -- border = "rounded",
        winblend = 10,
      },
    }
    local map = vim.keymap.set
    map("n", "<leader>.", fzf.files)
    map("n", "<leader>fo", fzf.oldfiles)
    map("n", "<leader><leader>", fzf.buffers)
    map("n", "<leader>hh", fzf.helptags)
    map("n", "<leader>/", fzf.grep_curbuf)
    map("n", "<leader>sp", fzf.live_grep_native)
    map("n", "<leader>s.", fzf.grep_cWORD)
    map("n", "<leader>,", fzf.resume)
    map("n", "<leader>ht", fzf.colorschemes)
  end,
}
