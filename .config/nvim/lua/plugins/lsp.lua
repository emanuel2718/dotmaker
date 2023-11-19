return {
  {
    "onsails/lspkind-nvim",
    init = function()
      return { mode = "symbol" }
    end,
  },
  { "SmiteshP/nvim-navic" },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "folke/neodev.nvim",
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
      },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require("mason")

      mason.setup({
        ui = { border = "rounded" },
      })

      local function on_attach(client, bufnr)
        vim.diagnostic.config({
          virtual_text = false,
          severity_sort = true,
          float = {
            border = "rounded",
            source = "always",
            title = "Diagnostics",
          },
        })

        -- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        --   vim.lsp.handlers.hover,
        --   {border = 'rounded', title = 'Hover'}
        -- )

        vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
          config = require("utils").mergeTable(config or {}, { border = "rounded", title = "Hover" })
          config.focus_id = ctx.method
          if not (result and result.contents) then
            return
          end
          local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
          markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
          if vim.tbl_isempty(markdown_lines) then
            return
          end
          return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
        end

        vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

        -- local function nmap(keys, func, desc)
        --   if desc then
        --     desc = "LSP: " .. desc
        --   end
        --
        --   vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        -- end
        local map = vim.keymap.set

        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<C-c>", vim.lsp.buf.code_action)
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "gr", require("telescope.builtin").lsp_references)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "<leader>dl", vim.diagnostic.open_float)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
        map("n", "<leader>td", vim.lsp.buf.type_definition)
        map("n", "<leader>si", require("telescope.builtin").lsp_document_symbols)
        map("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
        map("n", "K", vim.lsp.buf.hover)
        map("i", "<C-k>", vim.lsp.buf.signature_help)
        map("n", "<leader>k", vim.lsp.buf.signature_help)
        map("n", "<leader>lc", ":LspRestart<cr>")
        map("n", "<leader>lf", function()
          require("conform").format({ async = true, lsp_fallback = true })
        end)

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_create_user_command("Format", function(args)
          local range = nil
          if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
              start = { args.line1, 0 },
              ["end"] = { args.line2, end_line:len() },
            }
          end
          require("conform").format({ async = true, lsp_fallback = true, range = range })
        end, { range = true })

        if client.server_capabilities["documentSymbolProvider"] then
          require("nvim-navic").attach(client, bufnr)
        end
      end

      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      -- local typescript_tools = require('typescript-tools')

      -- ########################### NEODEV ###########################
      local neodev = require("neodev")
      neodev.setup()

      -- ########################### LSP ###########################
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      require("lspconfig.ui.windows").default_options.border = "rounded"

      local servers = {
        tailwindcss = {},
        cssls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            completion = { callSnippet = "Replace" },
            diagnostics = {
              globals = { "vim" },
            },
            format = {
              enable = true,
              defaultConfig = {
                quote_style = "single",
                space_around_table_field_list = false,
                space_inside_square_brackets = false,
              },
            },
          },
        },
        eslint = { format = false },
        emmet_language_server = {},
        tsserver = {},
        volar = {},
        bashls = {},
      }

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
        tsserver = function()
          lspconfig.tsserver.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              javascript = {
                format = {
                  enable = false,
                  insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
                  insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
                },
                updateImportsOnFileMove = {
                  enabled = "always",
                },
              },
              typescript = {
                format = {
                  enable = false,
                  insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
                  insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
                  preferTypeOnlyAutoImports = true,
                },
                updateImportsOnFileMove = {
                  enabled = "always",
                },
              },
            },
            commands = {
              OrganizeImports = {
                function()
                  local params = {
                    command = "_typescript.organizeImports",
                    arguments = { vim.api.nvim_buf_get_name(0) },
                    title = "",
                  }
                  vim.lsp.buf.execute_command(params)
                end,
                description = "Organize imports",
              },
              RenameFile = {
                function()
                  local source_file, target_file

                  vim.ui.input({
                    prompt = "Source: ",
                    completion = "file",
                    default = vim.api.nvim_buf_get_name(0),
                  }, function(input)
                    source_file = input
                  end)

                  vim.ui.input({
                    prompt = "Target: ",
                    completion = "file",
                    default = source_file,
                  }, function(input)
                    target_file = input
                  end)

                  local params = {
                    command = "_typescript.applyRenameFile",
                    arguments = {
                      {
                        sourceUri = source_file,
                        targetUri = target_file,
                      },
                    },
                    title = "",
                  }

                  vim.lsp.util.rename(source_file, target_file, {})
                  vim.lsp.buf.execute_command(params)
                end,
              },
            },
          })
        end,
      })

      -- ########################### TYPESCRIPT ###########################
      local function typescript_keymap(user_command, lsp_command, description)
        vim.keymap.set("n", user_command, lsp_command, { desc = "Typescript: " .. description })
      end

      typescript_keymap("<leader>to", ":OrganizeImports<CR>", "Organize imports")
      typescript_keymap("<leader>tr", ":RenameFile<CR>", "Rename file")

      -- ########################### UFO ###########################
      -- local ufo = require("ufo")
      -- ufo.setup()
      --
      -- vim.keymap.set("n", "zR", ufo.openAllFolds)
      -- vim.keymap.set("n", "zM", ufo.closeAllFolds)
      -- vim.keymap.set("n", "K", function()
      --   local winid = ufo.peekFoldedLinesUnderCursor(true)
      --   if not winid then
      --     vim.lsp.buf.hover()
      --   end
      -- end, { desc = "LSP: Show hover documentation and folded code" })
    end,
  },
}

-- local autocmd = vim.api.nvim_create_autocmd
-- local augroup = require("utils").augroup("lsp")
--
-- return {
--   "neovim/nvim-lspconfig",
--   event = "BufReadPre",
--   cmd = { "Mason", "MasonUpdate" },
--   dependencies = {
--     {
--       "williamboman/mason.nvim",
--       build = ":MasonUpdate",
--       dependencies = "williamboman/mason-lspconfig.nvim",
--     },
--     { "folke/neodev.nvim" },
--     { "simrat39/rust-tools.nvim" },
--     { "pmizio/typescript-tools.nvim", dependencies = "nvim-lua/plenary.nvim" },
--   },
--   config = function()
--     require("neodev").setup()
--
--     require("mason").setup()
--     require("mason-lspconfig").setup({
--       ensure_installed = {
--         "cssls",
--         -- "emmet_ls",
--         "html",
--         "jsonls",
--         "lua_ls",
--         "marksman",
--         "pyright",
--         "rust_analyzer",
--         "tailwindcss",
--         "taplo",
--         "tsserver",
--         "vimls",
--         "volar",
--         "yamlls",
--       },
--     })
--
--     require("utils").ensure_package_installed.execute()
--
--     local lspconfig = require("lspconfig")
--     require("mason-lspconfig").setup_handlers({
--       function(server_name)
--         local capabilities = require("cmp_nvim_lsp").default_capabilities()
--         lspconfig[server_name].setup({
--           capabilities = capabilities,
--         })
--       end,
--       ["rust_analyzer"] = function()
--         require("rust-tools").setup({
--           server = { settings = { ["rust-analyzer"] = { checkOnSave = { command = "clippy" } } } },
--         })
--       end,
--       ["tsserver"] = function()
--         require("typescript-tools").setup({})
--       end,
--       ["volar"] = function()
--       end,
--       ["lua_ls"] = function()
--         lspconfig.lua_ls.setup({
--           settings = {
--             Lua = {
--               diagnostics = {
--                 globals = { "vim" },
--               },
--               hint = { enable = true },
--               workspace = {
--                 checkThirdParty = false,
--                 library = {
--                   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                   [vim.fn.stdpath("config") .. "/lua"] = true,
--                 },
--               },
--               telemetry = { enable = false },
--             },
--           },
--         })
--       end,
--     })
--     autocmd("lspattach", {
--       desc = "Stop lsp clients on buffer if buffer too big",
--       callback = function(args)
--         local bufnr = args.buf
--         if vim.api.nvim_buf_line_count(bufnr) < 10000 then
--           return
--         end
--
--         vim.notify("stopped lsp (file too big)")
--         local clients = vim.lsp.get_clients({ bufnr = bufnr })
--         for _, client in pairs(clients) do
--           client.stop()
--         end
--       end,
--       group = augroup,
--     })
--
--     autocmd("lspattach", {
--       desc = "Add lsp specific key maps for current buffer",
--       callback = function(args)
--         local map = vim.keymap.set
--
--         map("n", "K", vim.lsp.buf.hover)
--         map("n", "gk", vim.lsp.buf.signature_help)
--         map("i", "<C-k>", vim.lsp.buf.signature_help)
--         -- map("n", "gd", function()
--         --   telescope.lsp_definitions({ show_line = false })
--         -- end)
--         map("n", "gd", ":lua require('telescope.builtin').lsp_definitions({ show_line = false })<cr>")
--         map("n", "gD", ":lua require('telescope.builtin').lsp_type_definitions({ show_line = false })<cr>")
--         map("n", "gr", ":lua require('telescope.builtin').lsp_references({ show_line = false, include_declaration = false })<cr>")
--         map("n", "<leader>si", ":lua require('telescope.builtin').lsp_document_symbols()<cr>")
--         map("n", "[d", vim.diagnostic.goto_prev)
--         map("n", "]d", vim.diagnostic.goto_next)
--         map('n', "<leader>dl", vim.diagnostic.open_float)
--         map('n', "<leader>d.", ":lua require('telescope.builtin').diagnostics()<cr>")
--         map('n',"<C-c>", vim.lsp.buf.code_action)
--         map('n', "<leader>rn", vim.lsp.buf.rename)
--         map('n', '<leader>lc', ':LspRestart<cr>')
--       end,
--       group = augroup,
--     })
--   end,
-- }
