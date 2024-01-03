return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = { "markdown" },
  config = function()
    local g = vim.g
    local map = vim.keymap.set
    g.mkdp_browser = "chromium"
    map("n", "<leader>pm", "<cmd>MarkdownPreview<cr>", { noremap = true, silent = true })
  end,
}
