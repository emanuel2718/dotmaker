return {
  "ibhagwan/fzf-lua",
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({'max-perf'})
  end,
  keys = {
    { '<leader>.', '<cmd>FzfLua files<cr>' },
    { '<leader>sn', '<cmd>FzfLua files cwd=~/.config/nvim<cr>' },
    { '<leader>bi', '<cmd>FzfLua buffers<cr>' },
    { '<leader>so', '<cmd>FzfLua oldfiles<cr>' },
    { '<leader>sp', '<cmd>FzfLua live_grep_native<cr>' },
    { '<leader>sP', '<cmd>FzfLua grep<cr>' },
    { '<leader>ss', '<cmd>FzfLua grep_curbuf<cr>' },
    { '<leader>r.', '<cmd>FzfLua resume<cr>' },
    { '<leader>bt', '<cmd>FzfLua builtin<cr>' },
    { '<leader>hh', '<cmd>FzfLua helptags<cr>' },
    { '<leader>mt', '<cmd>FzfLua manpages<cr>' },
    { '<leader>ht', '<cmd>FzfLua colorschemes<cr>' },
  }
}
