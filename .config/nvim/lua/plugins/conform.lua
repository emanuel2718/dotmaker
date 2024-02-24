return {
  'stevearc/conform.nvim',
  config = function()
    require("conform.formatters.stylua").require_cwd = true
    require("conform").setup {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rust_analyzer" },
        python = { "isort", "black" },
        typescript = { { "prettier" } },
        javascript = { { "prettier" } },
        vue = { { "prettier" } },
      },
    }
  end
}
