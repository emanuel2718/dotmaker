return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf = require "fzf-lua"
    fzf.setup({ { "fzf-vim", "ivy" } }, {
      -- files = {
      --   fd_opts = "--color=never --type f --hidden --follow --exclude .git",
      --   rg_opts = "--color=never --files --hidden --follow -g '!.git'",
      --   find_opts = "-type f -not -path '*/.git/*'",
      -- },
      -- grep = {
      --   rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
      --   no_esc_esc = true,
      -- },
    })
    local map = vim.keymap.set
    map("n", "<leader>.", fzf.files)
    map("n", "<leader>ff", function()
      fzf.files { hidden = true }
    end)
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
