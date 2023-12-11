return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "pmizio/typescript-tools.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    -- local is_npm_package_installed = require("rami.utils").is_npm_package_installed

    -- Highlight line numbers for diagnostics
    vim.fn.sign_define("DiagnosticSignError", { numhl = "LspDiagnosticsLineNrError", text = "" })
    vim.fn.sign_define("DiagnosticSignWarn", { numhl = "LspDiagnosticsLineNrWarning", text = "" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "" })

    -- Configure diagnostics displaying
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        border = "rounded",
        format = function(diagnostic)
          if diagnostic.source == "" then
            return diagnostic.message
          end

          if diagnostic.source == "eslint" then
            return string.format(
              "%s [%s]",
              diagnostic.message,
              -- shows the name of the rule
              diagnostic.user_data.lsp.code
            )
          end

          return string.format("%s [%s]", diagnostic.message, diagnostic.source)
        end,
        suffix = function()
          return ""
        end,
        severity_sort = true,
        close_events = { "CursorMoved", "InsertEnter" },
      },
    })

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    local function on_attach(client, bufnr)
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
      map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
      map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
      map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      map("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      map("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      map("n", "<C-c>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      map("n", "<leader>si", "<cmd>Telescope lsp_document_symbols<CR>", opts)
      map("n", "<C-]>", '<cmd>lua vim.diagnostic.goto_next({float = {border = "rounded"}})<CR>', opts)
      map("n", "<C-[>", '<cmd>lua vim.diagnostic.goto_prev({float = {border = "rounded"}})<CR>', opts)
      map("n", "<leader>dl", "<cmd>vim.diagnostic.open_float<CR>", opts)
      map("n", "<leader>di", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      map("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)
      map("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
      map('n', '<leader>dl', "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    end
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = true,
      lineFoldingOnly = true,
    }

    require("neodev").setup({})

    -- Lua
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          diagnostics = {
            globals = { "vim", "use" },
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    })

    -- Vue
    lspconfig.volar.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      filetypes = { "vue", "typescript", "javascript" },
    })

    -- Clang
    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    -- Css
    lspconfig.cssls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        css = {
          lint = {
            -- Do not warn for Tailwind's @apply rule
            unknownAtRules = "ignore",
          },
        },
      },
    })

    -- Html
    lspconfig.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    -- Json
    lspconfig.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        json = {
          schemas = {
            { fileMatch = { "jsconfig.json" }, url = "https://json.schemastore.org/jsconfig" },
            { fileMatch = { "tsconfig.json" }, url = "https://json.schemastore.org/tsconfig" },
            { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package" },
            { fileMatch = { ".prettierrc.json", ".prettierrc" }, url = "https://json.schemastore.org/prettierrc.json" },
            { fileMatch = { ".eslintrc.json" }, url = "https://json.schemastore.org/eslintrc.json" },
          },
        },
      },
    })

    -- Pyright
    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.yamlls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        yaml = {
          schemas = {
            ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
            ["http://json.schemastore.org/composer"] = "composer.yaml",
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
            ["https://raw.githubusercontent.com/kamilkisiela/graphql-config/v3.0.3/config-schema.json"] = ".graphqlrc*",
            ["https://json.schemastore.org/github-workflow.json"] = ".github/workflow/*.yml",
          },
        },
      },
    })

    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    -- Tailwincss
    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        tailwindCSS = {
          classAttributes = {
            "class",
            "className",
            "classList",
            "enterActiveClass",
            "exitActiveClass",
            "enterClass",
            "exitToClass",
          },
        },
      },
    })

    -- Typescript
    -- local have_vue = is_npm_package_installed("vue")
    -- if not have_vue then
    --   require("typescript-tools").setup({})
    -- end

    -- Emmet
    lspconfig.emmet_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "php", "vue" },
      init_options = {
        html = {
          options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            ["output.selfClosingStyle"] = "xhtml",
          },
        },
      },
    })

    lspconfig.tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      filetypes = { "typescript", "javascript", "jsx", "tsx" },
    })
  end,
}
