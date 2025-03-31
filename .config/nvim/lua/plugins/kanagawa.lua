return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup {
      compile = false,   -- enable compiling the colorscheme
      undercurl = false, -- enable undercurls
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,   -- do not set background color
      dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {
          ui = { bg_gutter = "none" }
        } },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "dragon",  -- Load "wave" theme
      background = {     -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    }
  end,
}
