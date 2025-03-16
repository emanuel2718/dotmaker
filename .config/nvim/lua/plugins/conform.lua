return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            markdown = { "prettier", lsp_format = "fallback" },
            lua = { "stylua", lsp_format = "fallback" },
            rust = { "rust_analyzer", lsp_format = "fallback" },
            python = { "isort", "black", lsp_format = "fallback" },
            c = { "clang-format", lsp_format = "fallback" },
            cpp = { "clang-format", lsp_format = "fallback" },
            go = { "gofmt", lsp_format = "fallback" },
            typescript = { "prettier", lsp_format = "fallback" },
            javascript = { "prettier", lsp_format = "fallback" },
            javascriptreact = { "prettier", lsp_format = "fallback" },
            typescriptreact = { "prettier", lsp_format = "fallback" },
            html = { "prettier", lsp_format = "fallback" },
            css = { "prettier", lsp_format = "fallback" },
            yaml = { "prettier", lsp_format = "fallback" },
            vue = { "prettier", lsp_format = "fallback" },

        },
        default_format_opts = {
            timeout_ms = 3000,
            async = true,
            quiet = false,
            lsp_format = "fallback",
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = "fallback",
        }
    }
}
