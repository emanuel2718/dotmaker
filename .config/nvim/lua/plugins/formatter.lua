return {
  "stevearc/conform.nvim",
  event = "BufReadPre",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        markdown = { "prettierd", "markdownlint" },
        json = { "prettierd" },
        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        vue = { "prettierd", "eslint_d" },
        ["_"] = { "trim_whitespace" },
      },
    })
  end,
  init = function()
    require("utils").ensure_package_installed.add({
      "stylua",
      "prettierd",
      "markdownlint",
      "eslint_d",
    })
    require("utils").map("n", "<leader>lf", function()
      require("conform").format({ lsp_fallback = true, async = true })
    end)

    -- require("utils").bind_map("n")("<leader>lf", function()
    --   require("conform").format({ lsp_fallback = true, async = true })
    -- end, { desc = "Conform: Format buffer" })
  end,
}
