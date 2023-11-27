return {
  "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  config = function()
    require("toggle_lsp_diagnostics").init({ start_on = false })
    local map = vim.keymap.set
    local opts = { noremap = false, silent = true }
    map("n", "<leader>dd", "<cmd>ToggleDiag<cr>", opts)
  end,
}
