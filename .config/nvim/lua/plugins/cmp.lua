return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-cmdline",
    "roobert/tailwindcss-colorizer-cmp.nvim",
    { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
  },
  event =  "InsertEnter",
  config = function()
    require('tailwindcss-colorizer-cmp').setup({
      color_square_width = 2
    })

    local ok, lspkind = pcall(require, "lspkind")
      if not ok then
        return
    end

    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-p>"] = nil,
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
        ["<C-h>"] = function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end,
       }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
       }, {
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
      }),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      view = {
        docs = { auto_open = false },
        entries = { name = "custom", selection_order = "top_down" }
      },
      window = {
        documentation = {
          border = "rounded"
        }

      },
      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            nvim_lsp = "[LSP]",
            buffer = "[buf]",
            nvim_lua = "[lua]",
            path = "[path]",
            luasnip = "[snip]",
          },
        },
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find "^_+"
            local _, entry2_under = entry2.completion_item.label:find "^_+"
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      experimental = {
        native_menu = false,
        ghost_text = false,
      },
    })
  end

}
