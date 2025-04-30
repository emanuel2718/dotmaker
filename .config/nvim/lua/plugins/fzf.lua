return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf = require "fzf-lua"
    fzf.setup({ { "max-perf", "ivy" } }, {
      files = {
        previewer = false,
      },
    })
    local map = vim.keymap.set
    map("n", "<leader>.", function()
      fzf.files { previewer = false }
    end)
    map("n", "<leader>fo", fzf.oldfiles)
    map("n", "<leader><leader>", fzf.buffers)
    map("n", "<leader>hh", fzf.helptags)
    map("n", "<leader>/", fzf.grep_curbuf)
    map("n", "<leader>sp", function()
      fzf.live_grep { hidden = true }
    end)
    map("n", "<leader>s/", fzf.live_grep_native)
    map("n", "<leader>s.", fzf.grep_cword)
    map("v", "<leader>s.", fzf.grep_visual)
    map("n", "<leader>,", fzf.resume)
    map("n", "<leader>ht", fzf.colorschemes)
    map("n", "<leader>sf", function()
      local current_filename = vim.fn.expand "%:t:r"
      if current_filename ~= "" then
        fzf.live_grep { search = current_filename, hidden = true }
      end
    end)
    -- Add keybind to resume previous fzf search
    map("n", "<leader>ss", fzf.resume)
  end,
}
