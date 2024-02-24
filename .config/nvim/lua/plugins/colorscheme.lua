return {
  "blazkowolf/gruber-darker.nvim",
  config = function()
    require('gruber-darker').setup {
      bold = false,
      invert = {
        signs = false,
        tabline = false,
        visual = false,
      },
      italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = true,
      },
      undercurl = true,
      underline = true,
    }
    vim.cmd.colorscheme('gruber-darker')
  end
}
