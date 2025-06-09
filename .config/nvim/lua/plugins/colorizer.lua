return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require('colorizer').setup({ '*' })
    vim.keymap.set('n', '<leader>ci', '<cmd>ColorizerToggle<cr>')
  end
}
