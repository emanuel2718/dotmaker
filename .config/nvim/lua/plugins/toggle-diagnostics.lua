function ToggleLSPDiagnostics()
    local virtual_text = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not virtual_text })
end

return {
  "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  config = function()
    require("toggle_lsp_diagnostics").init({ start_on = true, virtual_text = false, underline = false })
    local opts = { noremap = false, silent = true }
    local map = vim.keymap.set
    map('n', '<leader>dd', "<cmd>lua ToggleLSPDiagnostics()<cr>", opts)
    map("n", "<leader>dD", "<cmd>ToggleDiag<cr>", opts)
  end,
}
