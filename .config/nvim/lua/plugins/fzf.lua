return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({})
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    map('n', '<leader>.', '<cmd>FzfLua files<cr>', opts)
    map('n', '<leader>fr', '<cmd>FzfLua oldfiles<cr>', opts)
    map('n', '<leader>ss', '<cmd>FzfLua blines<cr>', opts)
    map('n', '<leader>s.', '<cmd>FzfLua grep_cword<cr>', opts)
    map('n', '<leader>sp', '<cmd>FzfLua grep<cr>', opts)
    map('n', '<C-p>', '<cmd>FzfLua live_grep_native<cr>', opts)
    map('n', '<leader>gs', '<cmd>FzfLua git_status<cr>', opts)
    map('n', '<leader>gS', '<cmd>FzfLua git_stash<cr>', opts)
    map('n', '<leader>gc', '<cmd>FzfLua git_commits<cr>', opts)
    map('n', '<leader>gd', '<cmd>FzfLua changes<cr>', opts)
    map('n', '<leader>cc', '<cmd>FzfLua man_pages<cr>', opts)
    map('n', '<leader>ht', '<cmd>FzfLua colorschemes<cr>', opts)
    map('n', '<leader>km', '<cmd>FzfLua keymaps<cr>', opts)
  end

}
