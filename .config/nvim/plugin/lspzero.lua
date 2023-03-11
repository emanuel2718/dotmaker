local lsp = require("lsp-zero")
local map = vim.keymap.set

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  -- 'eslint',
  -- 'sumneko_lua',
  'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-p>'] = cmp.config.disable,
  ['<C-y>'] = cmp.config.disable,
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

lsp.set_preferences({
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'buffer',   keyword_length = 1 },
    { name = 'luasnip',  keyword_length = 1 },
  }
})

lsp.on_attach(function(client, buffr)
  local opts = { buffer = buffr, remap = false }
  map("n", "gd", function() vim.lsp.buf.definition() end, opts)
  map("n", "gr", function() vim.lsp.buf.references() end, opts)
  map('n', '<leader>lf', function() vim.lsp.buf.format() end, opts)
  map("n", "K", function() vim.lsp.buf.hover() end, opts)
  map("n", "<leader>i", function() vim.diagnostic.open_float() end, opts)
  map("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  map("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  map("n", "<leader>nn", function() vim.lsp.buf.rename() end, opts)
  map("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  map("n", "<leader>lc", ':LspRestart<cr>')
end)

lsp.setup()


vim.diagnostic.config({
  virtual_text = false,
  underline = true,
})
