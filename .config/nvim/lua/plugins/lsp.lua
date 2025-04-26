return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    -- local capabilities = require("blink.cmp").get_lsp_capabilities {
    --   textDocument = { completion = { completionItem = { snippetSupport = false } } },
    -- }

    local servers = {
      -- Lua
      volar = {
        filetypes = { "vue" },
        init_options = {
          vue = {
            -- disable hybrid mode
            hybridMode = false,
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            completion = { callSnippet = "Replace" },
            diagnostics = {
              globals = { "vim", "love" },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
      },
      -- Python
      ruff = {},
      -- Rust
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
          },
        },
      },
      -- C/C++
      clangd = {},
      jsonls = {},
      tailwindcss = {},
    }

    local ensure_installed = vim.tbl_keys(servers)
    local lspconfig = require "lspconfig"

    vim.diagnostic.config {
      virtual_text = {
        prefix = "",
        source = "if_many",
        spacing = 4,
      },
      float = {
        source = "if_many",
        border = "rounded",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }

    require("mason-lspconfig").setup {
      ensure_installed = ensure_installed,
      handlers = {
        function(server_name)
          local server_opts = servers[server_name] or {}
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
          lspconfig[server_name].setup(server_opts)
        end,
      },
    }

    local conform = require "conform"
    conform.setup {
      formatters_by_ft = {
        markdown = { "prettier", lsp_format = "fallback" },
        lua = { "stylua", lsp_format = "fallback" },
        rust = { "rustfmt", lsp_format = "fallback" },
        python = { "isort", "black", lsp_format = "fallback" },
        c = { "clang-format", lsp_format = "fallback" },
        cpp = { "clang-format", lsp_format = "fallback" },
        go = { "gofmt", lsp_format = "fallback" },
        typescript = { "prettier", lsp_format = "fallback" },
        javascript = { "prettier", lsp_format = "fallback" },
        javascriptreact = { "prettier", lsp_format = "fallback" },
        typescriptreact = { "prettier", lsp_format = "fallback" },
        html = { "prettier", lsp_format = "fallback" },
        css = { "prettier", lsp_format = "fallback" },
        yaml = { "prettier", lsp_format = "fallback" },
        vue = { "prettier", lsp_format = "fallback" },
      },
      default_format_opts = {
        -- timeout_ms = 3000,
        async = true,
        -- quiet = false,
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local auto_format = true
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end

        if not client.server_capabilities then
          return
        end

        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = args.buf,
          callback = function()
            if auto_format then
              conform.format { async = true, lsp_format = "fallback", quiet = false }
            end
          end,
        })

        local fzf = require "fzf-lua"
        local opts = { noremap = true, silent = true, buffer = args.buf }
        vim.keymap.set("n", "gd", fzf.lsp_definitions, opts)
        vim.keymap.set("n", "gr", fzf.lsp_references, opts)
        vim.keymap.set("n", "gi", fzf.lsp_implementations, opts)
        vim.keymap.set("n", "gD", fzf.lsp_declarations, opts)
        vim.keymap.set("n", "<leader>ll", fzf.lsp_document_symbols, opts)
        vim.keymap.set("n", "<leader>ls", fzf.lsp_live_workspace_symbols, opts)

        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>i", fzf.diagnostics_document, opts)
        vim.keymap.set("n", "<leader>I", fzf.diagnostics_workspace, opts)

        vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", opts)
        vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
        vim.keymap.set("n", "<leader>ti", "<cmd>InspectTree<cr>", opts)

        vim.keymap.set("n", "<leader>ff", function()
          auto_format = not auto_format
          print("Toggling auto format " .. (auto_format and "ON" or "OFF"))
        end, opts)
        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
          conform.format { lsp_format = "fallback", quiet = false }
        end, opts)

        vim.keymap.set("n", "<C-c>", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>k", function()
          vim.diagnostic.jump { float = false, count = -1 }
          vim.cmd "norm zz"
        end, opts)

        vim.keymap.set("n", "<leader>j", function()
          vim.diagnostic.jump { float = false, count = 1 }
          vim.cmd "norm zz"
        end, opts)

        vim.keymap.set("n", "<leader>dd", function()
          local enabled = vim.diagnostic.is_enabled { bufnr = args.buf }
          vim.diagnostic.enable(not enabled, { bufnr = args.buf })
          print("[NOTE] Diagnostics " .. (not enabled and "enabled" or "disabled"))
        end, opts)

        vim.keymap.set("n", "<leader>v", function()
          vim.cmd "vsplit | lua vim.lsp.buf.definition()"
          vim.cmd "norm zz"
        end, opts)
      end,
    })
  end,
}
