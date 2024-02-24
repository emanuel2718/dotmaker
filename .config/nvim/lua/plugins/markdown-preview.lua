return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = { "markdown" },
  config = function()
    local g = vim.g
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set
    g.mkdp_browser = "chromium"
    map("n", "<leader>pm", "<cmd>MarkdownPreview<cr>", opts)
  end,
}
