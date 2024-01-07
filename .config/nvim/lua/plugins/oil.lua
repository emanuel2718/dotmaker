return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require('oil')
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set

    map("n", "<C-n>", oil.open_float, opts)

    oil.setup({
      skip_confirm_for_simple_edits = true,
      use_default_keymaps = false,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["h"] = "actions.parent",
        ["l"] = "actions.select",
        ["<CR>"] = "actions.select",
        ["<C-r>"] = "actions.refresh",
        ["<C-c>"] = "actions.close",
        ["<C-h>"] = "actions.toggle_hidden",
        ["<C-m>"] = "actions.select_vsplit",
        ["<C-n>"] = "actions.select_split",
        ["gs"] = "actions.change_sort",
        ["_"] = "actions.open_cwd",
      },
      float = {
        padding = 4,
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return vim.startswith(name, ".DS_Store")
        end,
      },
    })
  end
}