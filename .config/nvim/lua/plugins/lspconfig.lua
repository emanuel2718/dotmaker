return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    local map = require('rami.utils').map
    local telescope_builtin = require('telescope.builtin')
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('rami-lsp-attach', { clear = true }),
      callback = function(event)
        local bufnr = event.buf
        local opts = vim.tbl_extend('force', { noremap = true, silent = true }, { buffer = event.buf })
        map('n', 'gd', telescope_builtin.lsp_definitions, opts)
        map('n', 'gD', vim.lsp.buf.declaration, opts)
        map('n', 'gd', telescope_builtin.lsp_references, opts)
        map('n', 'gi', telescope_builtin.lsp_implementations, opts)
        map('n', 'gt', telescope_builtin.lsp_type_definitions, opts)
        map('n', '<leader>si', telescope_builtin.lsp_document_symbols, opts)
        map('n', '<leader>sI', telescope_builtin.lsp_dynamic_workspace_symbols, opts)
        map('n', 'K', vim.lsp.buf.hover, opts)
        map('n', '<leader>rn', vim.lsp.buf.rename, opts)
        map('i', '<C-k>', vim.lsp.buf.signature_help, opts)
        map('n', '<C-c>', function()
          vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
        end)
        map('n', "<leader>lf", function()
          require('conform').format({ bufnr = bufnr, lsp_fallback = true })
        end, opts)


        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = event.buf,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = event.buf,
          callback = vim.lsp.buf.clear_references,
        })
      end
    })
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      rust_analyzer = {},
      volar = { filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' } }, -- take over mode
      lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })

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
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
          }
        end,
      },
    }
  end
}
