local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- removed tsserver
-- local servers = {'pylsp', 'eslint', 'rust_analyzer', 'sumneko_lua', 'ccls', 'marksman'}

-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     flags = {
--       debounce_text_changes = 150,
--     },
--     root_dir = function() return vim.loop.cwd() end
--   }
-- end

nvim_lsp.pylsp.setup{}
nvim_lsp.rust_analyzer.setup{}
nvim_lsp.tsserver.setup{}
nvim_lsp.graphql.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.bashls.setup{}
nvim_lsp.sumneko_lua.setup{}

nvim_lsp.jsonls.setup{
  cmd = { "vscode-json-languageserver", '--stdio' },
  settings = {
    json = {
      schemas = {
        {
          fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
          url = 'http://json.schemastore.org/tsconfig'
        },
        {
          fileMatch = {'lerna.json'},
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'Prettier config',
          fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
          url = 'http://json.schemastore.org/prettierrc'
        },
        {
          fileMatch = {'package.json'},
          url = 'http://json.schemastore.org/package'
        },
      }
    },
  }
}


local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
