return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_lsp = require("cmp_nvim_lsp")
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      map("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)
      map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
      map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
      map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      map("n", "gD", vim.lsp.buf.declaration, opts)
      map({ "n", "v" }, "<C-c>", vim.lsp.buf.code_action, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>df", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
      map("n", "<leader>di", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
      map("n", "<leader>dl", vim.diagnostic.open_float, opts)
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>lr", ":LspRestart<CR>", opts)
      map("i", "<C-k>", vim.lsp.buf.signature_help, opts)
      map("n", "<leader>k", vim.lsp.buf.signature_help, opts)
    end

    local capabilities = cmp_lsp.default_capabilities()
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Html
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Css
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Typescript
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Typescript
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Svelte
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Prisma
    lspconfig["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Pyright
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- JSON
    lspconfig["jsonls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Bash
    lspconfig["bashls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Clangd
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Cmake
    lspconfig["cmake"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Sql
    lspconfig["sqlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Volar
    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Vim
    lspconfig["vimls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Yaml
    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Rust
    lspconfig["rust_analyzer"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Lua
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
