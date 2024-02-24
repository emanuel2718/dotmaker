return {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
  config = function()
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set

    map('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', opts)
    map('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', opts)


    vim.g.skip_ts_context_commentstring_module = true
    require('ts_context_commentstring').setup({ enable_autocmd = true })

    require('Comment').setup({
      toggler = {
        ---Line-comment toggle keymap
        line = "gcc",
        ---Block-comment toggle keymap
        block = "gbc",
      },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end
}