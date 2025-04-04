return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  config = function()
    require("typescript-tools").setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        
        vim.api.nvim_buf_set_var(bufnr, "cmp_source_override", true)
      end,
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
      },
      settings = {
        tsserver_plugins = {
          "@vue/typescript-plugin",
        },
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      },
    }
  end,
}
