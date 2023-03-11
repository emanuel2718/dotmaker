local status, cmp = pcall(require, "cmp")
if not status then
  return
end
local lspkind = require("lspkind")
-- local ls = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  style = {
    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  },
  -- experimental = {
  --   ghost_text = true,
  -- },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item()),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    ['<C-p>'] = cmp.config.disable,
    ['<C-y>'] = cmp.config.disable,
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- TODO: add more sources but differentiate them better?
    { name = 'nvim_lsp_document_symbol' },
    { name = 'path' }
    -- { name = "buffer" },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end,
  },
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
