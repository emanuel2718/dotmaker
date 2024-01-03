local system = vim.loop.os_uname().sysname
local darwin_node = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v19.4.0/bin/node"
local linux_node = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v18.18.2/bin/node"

function cnc()
  if system == 'Darwin' then
    return darwin_node
  else
    return linux_node
  end
end


return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = "<A-;>",
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
      copilot_node_command = cnc(),
      server_opts_overrides = {},
    })

    local map = vim.keymap.set
    map("n", "<leader>;", function()
      return require("copilot.suggestion").toggle_auto_trigger()
    end)
  end,
}
