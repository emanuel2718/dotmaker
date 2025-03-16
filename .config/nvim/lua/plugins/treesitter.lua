return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash",
                "css",
                "c",
                "cpp",
                "gitignore",
                "html",
                "http",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "nix",
                "regex",
                "rust",
                "sql",
                "terraform",
                "toml",
                "python",
                "javascript",
                "vue",
                "typescript",
                "vimdoc",
                "yaml",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
