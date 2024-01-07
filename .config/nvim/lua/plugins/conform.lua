return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform.formatters.stylua").require_cwd = true
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        typescript = { { "prettierd", "prettier" } },
        javascript = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
      },
    }
  end
}