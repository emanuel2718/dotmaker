return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
  },
  event = "BufReadPre",
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    luasnip.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })
    -- vscode format
    -- require("luasnip.loaders.from_vscode").lazy_load()
    -- require("luasnip.loaders.from_vscode").lazy_load({
    --   paths = vim.g.vscode_snippets_path or "",
    -- })

    -- snipmate format
    -- require("luasnip.loaders.from_snipmate").load()
    -- require("luasnip.loaders.from_snipmate").lazy_load({
    --   paths = vim.g.snipmate_snippets_path or "",
    -- })

    -- lua format
    -- require("luasnip.loaders.from_lua").load()
    -- require("luasnip.loaders.from_lua").lazy_load({
    --   paths = vim.g.lua_snippets_path or "",
    -- })

    local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
    local function formatForTailwindCSS(entry, vim_item)
      if vim_item.kind == "Color" and entry.completion_item.documentation then
        local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
        if r then
          local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
          local group = "Tw_" .. color
          if vim.fn.hlID(group) < 1 then
            vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
          end
          vim_item.kind = "●"
          vim_item.kind_hl_group = group
          return vim_item
        end
      end
      vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
      return vim_item
    end

    -- vim.api.nvim_create_autocmd("InsertLeave", {
    --   callback = function()
    --     if
    --       require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
    --       and not require("luasnip").session.jump_active
    --     then
    --       require("luasnip").unlink_current()
    --     end
    --   end,
    -- })

    cmp.config.formatting = {
      format = require("tailwindcss-colorizer-cmp").formatter,
    }
    -- cmp
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup({
      ---@diagnostic disable-next-line: missing-fields
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
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
      }),
      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = lspkind.cmp_format({
          maxwidth = 200,
          ellipsis_char = "...",
          before = function(entry, item)
            local menu_icon = {
              nvim_lsp = "λ",
              luasnip = "✎",
              path = "Ψ",
              emoji = "🤌",
              nvim_lua = "Π",
              calc = "Σ",
              buffer = "Ω",
              cmdline = "⋗",
            }

            item = formatForTailwindCSS(entry, item)
            item.menu = menu_icon[entry.source.name] or entry.source.name

            return item
          end,
        }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        {
          name = "buffer",
          option = {
            -- Avoid accidentally running on big files
            get_bufnrs = function()
              local buf = vim.api.nvim_get_current_buf()
              local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
              if byte_size > 1024 * 1024 then -- 1 Megabyte max
                return {}
              end
              return { buf }
            end,
          },
        },
        { name = "path" },
        -- { name = "emoji" },
        -- { name = "calc" },
      }),
      enabled = function()
        -- disable completion in comments
        local context = require("cmp.config.context")

        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end
      end,
    })
  end,
}
