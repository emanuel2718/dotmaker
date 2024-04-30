-- return {
--   "EdenEast/nightfox.nvim",
--   config = function()
--     require('nightfox').setup({})
--     vim.cmd("colorscheme carbonfox")
--   end
-- }

return {
  'tanvirtin/monokai.nvim',
  config = function()
    require('monokai').setup { 
      italics = false,
      -- palette = require('monokai').pro
      palette = {
        name = 'monokai',
        base1 = '#272a30',
        base2 = '#1E1E1E',
        base3 = '#2E323C',
        base4 = '#333842',
        base5 = '#4d5154',
        base6 = '#9ca0a4',
        base7 = '#b1b1b1',
        border = '#a1b5b1',
        brown = '#504945',
        white = '#f8f8f0',
        grey = '#8F908A',
        black = '#000000',
        pink = '#f92672',
        green = '#a6e22e',
        aqua = '#66d9ef',
        yellow = '#e6db74',
        orange = '#fd971f',
        purple = '#ae81ff',
        red = '#e95678',
        diff_add = '#3d5213',
        diff_remove = '#4a0f23',
        diff_change = '#27406b',
        diff_text = '#23324d',
    },
    custom_hlgroups = {},
    }
  end
}

-- return {
--   "miikanissi/modus-themes.nvim",
--   priority = 1000,
--   config = function()
--     require("modus-themes").setup({
--       -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
--       -- `auto` will automatically set style based on background set with vim.o.background
--       style = "modus_vivendi",
--       variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
--       transparent = false, -- Transparent background (as supported by the terminal)
--       dim_inactive = false, -- "non-current" windows are dimmed
--       styles = {
--         -- Style to be applied to different syntax groups
--         -- Value is any valid attr-list value for `:help nvim_set_hl`
--         comments = { italic = false },
--         keywords = { italic = false },
--         functions = {},
--         variables = {},
--       },
--     })
--     vim.cmd("colorscheme modus")
--   end
-- }

-- return {
--   'loctvl842/monokai-pro.nvim',
--   config = function()
--     require("monokai-pro").setup({
--       transparent_background = false,
--       terminal_colors = true,
--       devicons = true, -- highlight the icons of `nvim-web-devicons`
--       styles = {
--         comment = { italic = false },
--         keyword = { italic = false },   -- any other keyword
--         type = { italic = false },      -- (preferred) int, long, char, etc
--         storageclass = { italic = false }, -- static, register, volatile, etc
--         structure = { italic = false }, -- struct, union, enum, etc
--         parameter = { italic = false }, -- parameter pass in function
--         annotation = { italic = false },
--         tag_attribute = { italic = false }, -- attribute of tag in reactjs
--       },
--       filter = "classic",                  -- classic | octagon | pro | machine | ristretto | spectrum
--       -- Enable this will disable filter option
--       day_night = {
--         enable = false,        -- turn off by default
--         day_filter = "pro",    -- classic | octagon | pro | machine | ristretto | spectrum
--         night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
--       },
--       inc_search = "background", -- underline | background
--       background_clear = {
--         -- "float_win",
--         "toggleterm",
--         "telescope",
--         -- "which-key",
--         "renamer",
--         "notify",
--         -- "nvim-tree",
--         -- "neo-tree",
--         -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
--       }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
--       plugins = {
--         bufferline = {
--           underline_selected = false,
--           underline_visible = false,
--         },
--         indent_blankline = {
--           context_highlight = "default", -- default | pro
--           context_start_underline = false,
--         },
--       },
--     })
--     vim.cmd("colorscheme monokai-pro")
--   end
--
-- }
