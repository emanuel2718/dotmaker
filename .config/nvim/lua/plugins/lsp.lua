return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim",       opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities {
      textDocument = { completion = { completionItem = { snippetSupport = false } } },
    }

    local servers = {
      -- Vue
      volar = {
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      },
      -- TypeScript
      ts_ls = {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.stdpath "data"
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
              languages = { "vue" },
            },
          },
        },
        settings = {
          typescript = {
            tsserver = {
              useSyntaxServer = false,
            },
          },
        },
      },
      -- Lua
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
        checkOnSave = {
          command = "clippy",
        },
      },
      -- C/C++
      clangd = {},
      jsonls = {},
      tailwindcss = {},
    }

    local ensure_installed = vim.tbl_keys(servers)
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }
    local lspconfig = require "lspconfig"

    require("mason-lspconfig").setup {
      ensure_installed = ensure_installed,
      handlers = {
        function(server_name)
          local opts = servers[server_name] or {}
          opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
          lspconfig[server_name].setup(opts)
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
        -- async = true,
        -- quiet = false,
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local auto_format = true
        local c = vim.lsp.get_client_by_id(args.data.client_id)
        if not c then
          return
        end

        -- Format the current buffer on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = args.buf,
          callback = function()
            if auto_format then
              conform.format { lsp_format = "fallback", quiet = false }
            end
            -- vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
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

        vim.keymap.set("i", "<C-k>", function()
          vim.lsp.buf.signature_help {}
        end, opts)
        vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>i", fzf.diagnostics_document, opts)
        vim.keymap.set("n", "<leader>I", fzf.diagnostics_workspace, opts)

        vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", opts)
        vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
        vim.keymap.set("n", "<leader>ti", "<cmd>InspectTree<cr>", opts)

        vim.keymap.set("n", "<leader>ff", function()
          if auto_format then
            auto_format = false
            print "Toggling auto format OFF!"
          else
            print "Toggling auto format ON!"
            auto_format = true
          end
          -- auto_format = not auto_format -- toggle it
        end, opts)
        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
          conform.format { lsp_format = "fallback", quiet = false }
        end)

        vim.keymap.set("n", "<C-c>", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>k", function()
          vim.diagnostic.jump { count = -1 }
          vim.cmd "norm zz"
        end, opts)

        -- No longer need https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim as is now builtin
        vim.keymap.set("n", "<leader>dd", function()
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, opts)

        vim.keymap.set("n", "<leader>j", function()
          vim.diagnostic.jump { count = 1 }
          vim.cmd "norm zz"
        end, opts)

        vim.keymap.set("n", "<leader>v", function()
          vim.cmd "vsplit | lua vim.lsp.buf.definition()"
          vim.cmd "norm zz"
        end, opts)
      end,
    })
  end,
}
