return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "windwp/nvim-ts-autotag" },
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = { 'VeryLazy', 'BufRead' },
  config = function()
    local treesitter_parsers = require("nvim-treesitter.parsers")
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "css",
        "scss",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "sql",
        "prisma",
        "php",
        "vue"
      },
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          if vim.api.nvim_buf_line_count(bufnr) < 10000 then
            return false
          end

          vim.notify("Stopped Treesitter (file too big)")
          return true
        end,
      },
      indent = {
        enable = true,
        disable = {},
      },
      matchup = {
        enable = true,
        disable = {},
      },
      autotag = {
        enable = true,
        -- enable_rename = true,
        enable_close = true,
        enable_close_on_slash = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
    })
    local parser_config = treesitter_parsers.get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end,
}
