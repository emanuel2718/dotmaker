return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform.formatters.stylua").require_cwd = true
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        typescript = { { "prettier" } },
        javascript = { { "prettier" } },
        vue = { { "prettier" } },
      },
    }
  end
}
