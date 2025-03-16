return {
    'saghen/blink.cmp',
    dependencies = { 'onsails/lspkind.nvim' },

    version = '*',
    ---@module 'blink.cmp'
    ---
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<Up>'] = { 'scroll_documentation_up', 'fallback' },
            ['<Down>'] = { 'scroll_documentation_down', 'fallback' },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                border = 'rounded',
                cmdline_position = function()
                    if vim.g.ui_cmdline_pos ~= nil then
                        local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                        return { pos[1] - 1, pos[2] }
                    end
                    local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
                    return { vim.o.lines - height, 0 }
                end,

                draw = {
                    columns = {
                        { 'kind_icon', 'label', gap = 1 },
                        { 'kind' },
                    },
                    components = {
                        kind_icon = {
                            text = function(item)
                                local kind = require('lspkind').symbol_map[item.kind] or ''
                                return kind .. ' '
                            end,
                            highlight = 'CmpItemKind',
                        },
                        label = {
                            text = function(item)
                                return item.label
                            end,
                            highlight = 'CmpItemAbbr',
                        },
                        kind = {
                            text = function(item)
                                return item.kind
                            end,
                            highlight = 'CmpItemKind',
                        },
                    },
                },
            },
        },
        sources = {
            default = { 'lsp', 'path', 'buffer' },
            providers = {
                lsp = {
                    -- min_keyword_length = 2, -- Number of characters to trigger porvider
                    score_offset = 0, -- Boost/penalize the score of the items
                },
                path = {
                    min_keyword_length = 0,
                },
                buffer = {
                    min_keyword_length = 2,
                },
            },
        },
    },
}
