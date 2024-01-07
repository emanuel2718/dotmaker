return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
   { "nvim-treesitter/nvim-treesitter-textobjects" },
  },
  config = function()
    local utils = require('rami.utils')
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "haskell",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "tsx",
        "typescript",
        "vimdoc",
        "vue",
        "yaml",
      },
      -- highlight = {
      --   enable = true,
      --   additional_vim_regex_highlighting = false,
      --   disable = utils.check_file_size
      -- },
      -- indent = { enable = true },
      -- autopairs = { enable = true },
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     -- Automatically jump forward to textobj, similar to targets.vim
      --     lookahead = true,
      --     keymaps = {
      --       -- You can use the capture groups defined in textobjects.scm
      --       ["af"] = "@function.outer",
      --       ["if"] = "@function.inner",
      --       ["at"] = "@class.outer",
      --       ["it"] = "@class.inner",
      --       ["ac"] = "@call.outer",
      --       ["ic"] = "@call.inner",
      --       ["aa"] = "@parameter.outer",
      --       ["ia"] = "@parameter.inner",
      --       ["al"] = "@loop.outer",
      --       ["il"] = "@loop.inner",
      --       ["ai"] = "@conditional.outer",
      --       ["ii"] = "@conditional.inner",
      --       ["a/"] = "@comment.outer",
      --       ["i/"] = "@comment.inner",
      --       ["ab"] = "@block.outer",
      --       ["ib"] = "@block.inner",
      --       ["as"] = "@statement.outer",
      --       ["is"] = "@scopename.inner",
      --       ["aA"] = "@attribute.outer",
      --       ["iA"] = "@attribute.inner",
      --       ["aF"] = "@frame.outer",
      --       ["iF"] = "@frame.inner",
      --     },
      --   },
      -- }
    })



  end



}
