return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local servers = {
      "clangd",
      "lua_ls",
      "cssls",
      "html",
      "tsserver",
      "pyright",
      "bashls",
      "jsonls",
      "yamlls",
      "marksman",
      "tailwindcss",
      "rust_analyzer",
      "volar",
    }

    require('mason').setup({
      ui = {
        border = "rounded"
      }
    })

    require('mason-lspconfig').setup({
      ensure_installed = servers
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>M', '<cmd>Mason<cr>', opts)
  end
}