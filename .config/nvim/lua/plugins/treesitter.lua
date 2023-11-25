return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/playground",
  },
  config = function()
    local utils = require("rami.utils")
    require("nvim-treesitter.install").compilers = { "gcc" }
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        use_languagetree = true,
        disable = utils.check_file_size,
      },
      indent = {
        enable = true,
      },
      playground = {
        enable = false,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
      },
      autotag = {
        enable = true,
        disable = utils.check_file_size,
      },
      autopairs = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "graphql",
        "haskell",
        "hcl",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "prisma",
        "proto",
        "python",
        "query",
        "regex",
        "scss",
        "sql",
        "svelte",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
      },
    })
  end,
}
