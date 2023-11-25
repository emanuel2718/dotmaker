return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()

    local ensure_installed = {
      -- Language servers
      "buf-language-server",
      "clangd",
      "css-lsp",
      "dockerfile-language-server",
      "emmet-ls",
      "eslint-lsp",
      "graphql-language-service-cli",
      "html-lsp",
      "intelephense",
      "json-lsp",
      "ltex-ls",
      "lua-language-server",
      "prisma-language-server",
      "rust-analyzer",
      "svelte-language-server",
      "tailwindcss-language-server",
      "typescript-language-server",
      "vue-language-server",
      "yaml-language-server",
      "zk",

      -- Linting and formatting
      "eslint_d",
      "stylua",
      "clang-format",
      "rustfmt",

      -- DAP servers
      "node-debug2-adapter",
      "firefox-debug-adapter",
    }

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
    end, {})
  end,
}
