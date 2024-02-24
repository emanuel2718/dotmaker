return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup {
      panel = {
        enabled = false,
        auto_refresh = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = "<C-y>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
    }
    local map = require('rami.utils').map
    map("n", "<leader>;", function()
      return require("copilot.suggestion").toggle_auto_trigger()
    end)
    -- local autopairs = require("nvim-autopairs")
    -- local suggestion = require("copilot.suggestion")
    -- map("i", "<C-;>", function()
    --   autopairs.disable()
    --   suggestion.accept()
    --   autopairs.enable()
    -- end)

    -- map("i", "<C-;>", function()
    --   return require("copilot.suggestion").accept()
    -- end)
  end,

}
