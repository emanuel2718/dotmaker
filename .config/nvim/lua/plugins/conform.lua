return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      markdown = { "prettier" },
      lua = { "stylua" },
      rust = { "rustfmt" },
      python = { "isort" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      go = { "gofmt" },
      typescript = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      nix = { "nixpkgs-fmt" },
      html = { "prettier" },
      css = { "prettier" },
      yaml = { "prettier" },
      vue = { "prettier" },
    },
    default_format_opts = {
      -- timeout_ms = 3000,
      -- async = true,
      -- quiet = false,
      async = true,
      lsp_format = "fallback",
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      desc = "Conform format",
    },
  },
}
