return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities {
      textDocument = { completion = { completionItem = { snippetSupport = false } } },
    }

    local lspconfig = require "lspconfig"
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
        vim.keymap.set("n", "<leader>d.", fzf.diagnostics_document, opts)
        vim.keymap.set("n", "<leader>D.", fzf.diagnostics_workspace, opts)

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

    -- local auto_format = true

    -- local capabilities = vim.lsp.protocol.make_client_capabilities
    -- capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

    -- local servers = {
    --   volar = {
    --     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    --   },
    --   lua_ls = {
    --     settings = {
    --       Lua = {
    --         runtime = {
    --           version = "LuaJIT",
    --         },
    --         completion = { callSnippet = "Replace" },
    --         diagnostics = {
    --           globals = { "vim", "love" },
    --         },
    --         workspace = {
    --           library = {
    --             vim.env.VIMRUNTIME,
    --           },
    --         },
    --       },
    --     },
    --   },
    --   ruff = {},
    --   rust_analyzer = {
    --     checkOnSave = {
    --       command = "clippy",
    --     },
    --   },
    --   clangd = {},
    --   -- stylua = {},
    --   jsonls = {},
    --   tailwindcss = {},
    -- }

    -- require("mason").setup()

    -- local ensure_installed = vim.tbl_keys(servers)
    -- require("mason-tool-installer").setup { ensure_installed = ensure_installed }
    -- local lspconfig = require "lspconfig"

    -- -- Setup mason-lspconfig
    -- require("mason-lspconfig").setup {
    --   ensure_installed = ensure_installed,
    --   handlers = {
    --     function(server_name)
    --       local opts = servers[server_name] or {}
    --       opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
    --       lspconfig[server_name].setup(opts)
    --     end,
    --   },
    -- }

    -- local auto_format = true
    -- local is_v10 = vim.fn.has "nvim-0.10" == 1

    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   group = vim.api.nvim_create_augroup("vizquit-lsp-attach", { clear = true }),
    --   callback = function(event)
    --     local map = vim.keymap.set
    --     local snacks = require "snacks"

    --     map("n", "gd", function()
    --       snacks.picker.lsp_definitions()
    --     end)
    --     map("n", "gD", function()
    --       snacks.picker.lsp_declarations()
    --     end)
    --     map("n", "gr", function()
    --       snacks.picker.lsp_references()
    --     end)
    --     map("n", "gi", function()
    --       snacks.picker.lsp_implementations()
    --     end)
    --     map("n", "gt", function()
    --       snacks.picker.lsp_type_definitions()
    --     end)
    --     map("n", "<leader>ll", function()
    --       snacks.picker.lsp_symbols()
    --     end)
    --     map("n", "<leader>lw", function()
    --       snacks.picker.lsp_workspace_symbols()
    --     end)
    --     map("n", "<leader>rn", vim.lsp.buf.rename)
    --     map("n", "<C-c>", vim.lsp.buf.code_action)
    --     map("x", "<C-c>", vim.lsp.buf.code_action)
    --     map("n", "gl", vim.diagnostic.open_float)

    --     map("n", "<leader>li", ":LspInfo<CR>")
    --     map("n", "<leader>lr", ":LspRestart<CR>")

    --     map("n", "<leader>ff", function()
    --       if auto_format then
    --         auto_format = false
    --         print "Toggling auto format OFF!"
    --       else
    --         print "Toggling auto format ON!"
    --         auto_format = true
    --       end
    --       -- auto_format = not auto_format -- toggle it
    --     end)

    --     map("n", "<leader>k", function()
    --       if is_v10 then
    --         ---@diagnostic disable-next-line: deprecated
    --         vim.diagnostic.goto_prev()
    --       else
    --         vim.diagnostic.jump { count = -1 }
    --       end
    --       vim.cmd "norm zz"
    --     end)
    --     map("n", "<leader>j", function()
    --       if is_v10 then
    --         ---@diagnostic disable-next-line: deprecated
    --         vim.diagnostic.goto_next()
    --       else
    --         vim.diagnostic.jump { count = 1 }
    --       end
    --       vim.cmd "norm zz"
    --     end)

    --     map("n", "<leader>v", function()
    --       vim.cmd "vsplit | lua vim.lsp.buf.definition()"
    --       vim.cmd "norm zz"
    --     end)

    --     local client = vim.lsp.get_client_by_id(event.data.client_id)
    --     if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    --       local highlight_group = vim.api.nvim_create_augroup("vizquit-lsp-highlight", { clear = false })
    --       vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    --         buffer = event.buf,
    --         group = highlight_group,
    --         callback = vim.lsp.buf.document_highlight,
    --       })
    --       vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    --         buffer = event.buf,
    --         group = highlight_group,
    --         callback = vim.lsp.buf.clear_references,
    --       })
    --     end
    --   end,
    -- })
  end,
}
