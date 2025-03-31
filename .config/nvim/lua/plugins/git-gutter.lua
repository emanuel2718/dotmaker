return {
  "echasnovski/mini.diff",
  config = function()
    local minidiff = require "mini.diff"
    minidiff.setup()

    vim.keymap.set("n", "<leader>gh", function()
      minidiff.toggle_overlay()
    end)
  end,
}
