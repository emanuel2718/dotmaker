return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim",       opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    local utils = require('core.utils')

    vim.diagnostic.config {
      virtual_text = {
        prefix = "",
        source = "if_many",
        spacing = 4,
      },
      float = {
        source = "if_many",
        border = "rounded",
      },
      signs = false,
      underline = false,
      update_in_insert = false,
      severity_sort = true,
    }


    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_buf_conf", { clear = true }),
      callback = function(event_context)
        local client = vim.lsp.get_client_by_id(event_context.data.client_id)

        if not client then
          return
        end

        local bufnr = event_context.buf

        -- Mappings.
        local map = function(mode, l, r, opts)
          opts = opts or {}
          opts.silent = true
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        local builtin = require('telescope.builtin')
        local fzf = require('fzf-lua')

        -- map("n", "gd", fzf.lsp_definitions)
        -- map("n", "gD", fzf.lsp_declarations)
        -- map("n", "gr", fzf.lsp_references)
        -- map("n", "<leader>ll", fzf.lsp_document_symbols)
        -- map("n", "<leader>ls", fzf.lsp_live_workspace_symbols)
        -- map("n", "<leader>i", fzf.diagnostics_document)
        -- map("n", "<leader>I", fzf.diagnostics_workspace)

        map("n", "gd", builtin.lsp_definitions)
        map("n", "gr", builtin.lsp_references)
        map("n", "<leader>ll", builtin.lsp_document_symbols)
        map("n", "<leader>ls", builtin.lsp_workspace_symbols)
        map("n", "<leader>i", builtin.diagnostics)

        map("n", "<C-]>", vim.lsp.buf.definition)
        map("n", "gl", vim.diagnostic.open_float)
        map("n", "<leader>lr", "<cmd>LspRestart<cr>")
        map("n", "<leader>ti", "<cmd>InspectTree<cr>")
        map("n", "K", function()
          vim.lsp.buf.hover { border = "single", max_height = 25, max_width = 120 }
        end)
        map("i", "<C-,>", vim.lsp.buf.signature_help)
        map("n", "<C-,>", vim.lsp.buf.signature_help)
        map("n", "gn", vim.lsp.buf.rename, { desc = "varialbe rename" })
        map("n", "<C-c>", fzf.lsp_code_actions, { desc = "LSP code action" })

        vim.keymap.set("n", "<leader>k", function()
          vim.diagnostic.jump { float = false, count = -1 }
          vim.cmd "norm zz"
        end)

        vim.keymap.set("n", "<leader>j", function()
          vim.diagnostic.jump { float = false, count = 1 }
          vim.cmd "norm zz"
        end)

        vim.keymap.set("n", "<leader>dd", function()
          local enabled = vim.diagnostic.is_enabled { bufnr = bufnr }
          vim.diagnostic.enable(not enabled, { bufnr = bufnr })
          print("[NOTE] Diagnostics " .. (not enabled and "enabled" or "disabled"))
        end)

        vim.keymap.set("n", "<leader>v", function()
          vim.cmd "vsplit | lua vim.lsp.buf.definition()"
          vim.cmd "norm zz"
        end)


        map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
        map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
        map("n", "<space>wl", function()
          vim.print(vim.lsp.buf.list_workspace_folders())
        end, { desc = "list workspace folder" })

        -- Set some key bindings conditional on server capabilities
        -- Disable ruff hover feature in favor of Pyright
        if client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end

        -- Uncomment code below to enable inlay hint from language server, some LSP server supports inlay hint,
        -- but disable this feature by default, so you may need to enable inlay hint in the LSP server config.
        -- vim.lsp.inlay_hint.enable(true, {buffer=bufnr})

        -- The blow command will highlight the current variable and its usages in the buffer.
        if client.server_capabilities.documentHighlightProvider then
          local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
          vim.api.nvim_create_autocmd("CursorHold", {
            group = gid,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.document_highlight()
            end,
          })

          vim.api.nvim_create_autocmd("CursorMoved", {
            group = gid,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.clear_references()
            end,
          })
        end
      end,
      nested = true,
      desc = "Configure buffer keymap and behavior based on LSP",
    })

    -- Enable lsp servers when they are available

    local capabilities = utils.get_default_capabilities();

    vim.lsp.config("*", {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 500,
      },
    })

    local servers = {
      -- Lua
      vue_ls = {
        filetypes = { "vue" },
        init_options = {
          vue = {
            -- disable hybrid mode
            hybridMode = false,
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            completion = { callSnippet = "Replace" },
            diagnostics = {
              globals = { "vim", "love" },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
      },
      -- Python
      ruff = {},
      -- Rust
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = true,
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" }
            }
          },
        },
      },
      -- C/C++
      clangd = {},
      jsonls = {},
      tailwindcss = {},
    }

    local ensure_installed = vim.tbl_keys(servers)
    for server in ipairs(servers) do
      vim.lsp.enable(server)
    end

    require("mason-lspconfig").setup {
      ensure_installed = ensure_installed,
    }
  end
}
