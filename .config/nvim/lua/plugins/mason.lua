return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  opts = {
    PATH = "prepend",
    max_concurrent_installers = 10,
  },
  config = function()
    local mason_tool_installer = require("mason-tool-installer")
    local mason = require("mason")
    mason.setup({
      PATH = 'prepend',
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
      },
      run_on_start = true,
      debounce_hours = 24
    })

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "prismals",
        "pyright",
        "jsonls",
        "bashls",
        "clangd",
        "cmake",
        "sqlls",
        "volar",
        "vimls",
        "yamlls",
        "rust_analyzer",
      }
    })
  end,
}
