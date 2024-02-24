return {
  "eandrju/cellular-automaton.nvim",
  config = function()
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set

    map('n', '<leader>y', '<cmd>CellularAutomaton make_it_rain<cr>', opts)
  end
}