return {
  "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  config = function()
    require("toggle_lsp_diagnostics").init({ start_on = true })
    local opts = { noremap = false, silent = true }
    local map = vim.keymap.set
    map("n", "<leader>dd", "<cmd>ToggleDiag<cr>", opts)
  end,
}
