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

    require('mason').setup()
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            require('lspconfig')[server_name].setup {
              cmd = server.cmd,
              settings = server.settings,
              filetypes = server.filetypes,
              -- This handles overriding only values explicitly passed
              -- by the server configuration above. Useful when disabling
              -- certain features of an LSP (for example, turning off formatting for tsserver)
              capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
            }
          end,
        },
      }
  end
}
