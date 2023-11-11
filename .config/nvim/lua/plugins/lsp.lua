local autocmd = vim.api.nvim_create_autocmd
local augroup = require("utils").augroup("lsp")

return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  cmd = { "Mason", "MasonUpdate" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      dependencies = "williamboman/mason-lspconfig.nvim",
    },
    { "folke/neodev.nvim" },
    { "simrat39/rust-tools.nvim" },
    { "pmizio/typescript-tools.nvim", dependencies = "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("neodev").setup()

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "emmet_ls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
        "taplo",
        "tsserver",
        "vimls",
        "volar",
        "yamlls",
      },
    })

    require("utils").ensure_package_installed.execute()

    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["rust_analyzer"] = function()
        require("rust-tools").setup({
          server = { settings = { ["rust-analyzer"] = { checkOnSave = { command = "clippy" } } } },
        })
      end,
      ["tsserver"] = function()
        require("typescript-tools").setup({})
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              hint = { enable = true },
              workspace = {
                checkThirdParty = false,
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              telemetry = { enable = false },
            },
          },
        })
      end,
    })
    autocmd("lspattach", {
      desc = "Stop lsp clients on buffer if buffer too big",
      callback = function(args)
        local bufnr = args.buf
        if vim.api.nvim_buf_line_count(bufnr) < 10000 then
          return
        end

        vim.notify("stopped lsp (file too big)")
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        for _, client in pairs(clients) do
          client.stop()
        end
      end,
      group = augroup,
    })

    autocmd("lspattach", {
      desc = "Add lsp specific key maps for current buffer",
      callback = function(args)
        local map = vim.keymap.set

        map("n", "K", vim.lsp.buf.hover)
        map("n", "gk", vim.lsp.buf.signature_help)
        map("i", "<C-k>", vim.lsp.buf.signature_help)
        -- map("n", "gd", function()
        --   telescope.lsp_definitions({ show_line = false })
        -- end)
        map("n", "gd", ":lua require('telescope.builtin').lsp_definitions({ show_line = false })<cr>")
        map("n", "gD", ":lua require('telescope.builtin').lsp_type_definitions({ show_line = false })<cr>")
        map("n", "gr", ":lua require('telescope.builtin').lsp_references({ show_line = false, include_declaration = false })<cr>")
        map("n", "<leader>si", ":lua require('telescope.builtin').lsp_document_symbols()<cr>")
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
        map('n', "<leader>ld", vim.diagnostic.open_float)
        map('n', "<leader>d.", ":lua require('telescope.builtin').diagnostics()<cr>")
        map('n',"<C-c>", vim.lsp.buf.code_action)
        map('n', "<leader>rn", vim.lsp.buf.rename)
      end,
      group = augroup,
    })
  end,
}
