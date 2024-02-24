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
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = utils.check_file_size
      },
      auto_install = true,
      indent = { enable = true },
      autopairs = { enable = true },
    })
  end
}
