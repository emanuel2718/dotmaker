return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim',       opts = {} },
        'saghen/blink.cmp',
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

        local servers = {
            volar = {
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        completion = { callSnippet = 'Replace' },
                        diagnostics = {
                            globals = { 'vim', 'love' },
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                },
            },
            ruff = {},
            rust_analyzer = {
                checkOnSave = {
                    command = "clippy"
                }
            },
            clangd = {},
            -- stylua = {},
            jsonls = {},
            tailwindcss = {}


        }

        require('mason').setup()

        local ensure_installed = vim.tbl_keys(servers)
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }
        local lspconfig = require('lspconfig')

        -- Setup mason-lspconfig
        require('mason-lspconfig').setup {
            ensure_installed = ensure_installed,
            handlers = {
                function(server_name)
                    local opts = servers[server_name] or {}
                    opts.capabilities = vim.tbl_deep_extend('force', {}, capabilities, opts.capabilities or {})
                    lspconfig[server_name].setup(opts)
                end,
            },
        }

        local auto_format = true
        local is_v10 = vim.fn.has "nvim-0.10" == 1

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('vizquit-lsp-attach', { clear = true }),
            callback = function(event)
                local map = vim.keymap.set
                local snacks = require("snacks")


                map("n", 'gd', function() snacks.picker.lsp_definitions() end)
                map("n", 'gD', function() snacks.picker.lsp_declarations() end)
                map("n", 'gr', function() snacks.picker.lsp_references() end)
                map("n", 'gi', function() snacks.picker.lsp_implementations() end)
                map("n", 'gt', function() snacks.picker.lsp_type_definitions() end)
                map("n", '<leader>ll', function() snacks.picker.lsp_symbols() end)
                map("n", '<leader>lw', function() snacks.picker.lsp_workspace_symbols() end)
                map("n", '<leader>rn', vim.lsp.buf.rename)
                map("n", '<C-c>', vim.lsp.buf.code_action)
                map("x", '<C-c>', vim.lsp.buf.code_action)
                map("n", 'gl', vim.diagnostic.open_float)

                map("n", '<leader>li', ":LspInfo<CR>")
                map("n", '<leader>lr', ":LspRestart<CR>")

                map("n", "<leader>ff", function()
                    if auto_format then
                        auto_format = false
                        print "Toggling auto format OFF!"
                    else
                        print "Toggling auto format ON!"
                        auto_format = true
                    end
                    -- auto_format = not auto_format -- toggle it
                end)

                map("n", "<leader>k", function()
                    if is_v10 then
                        ---@diagnostic disable-next-line: deprecated
                        vim.diagnostic.goto_prev()
                    else
                        vim.diagnostic.jump { count = -1 }
                    end
                    vim.cmd "norm zz"
                end)
                map("n", "<leader>j", function()
                    if is_v10 then
                        ---@diagnostic disable-next-line: deprecated
                        vim.diagnostic.goto_next()
                    else
                        vim.diagnostic.jump { count = 1 }
                    end
                    vim.cmd "norm zz"
                end)

                map("n", "<leader>v", function()
                    vim.cmd "vsplit | lua vim.lsp.buf.definition()"
                    vim.cmd "norm zz"
                end)



                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_group = vim.api.nvim_create_augroup('vizquit-lsp-highlight', { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' },
                        {
                            buffer = event.buf,
                            group = highlight_group,
                            callback = vim.lsp.buf.document_highlight,
                        })
                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_group,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })
    end,
}
-- return {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--         "williamboman/mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-path",
--         "hrsh7th/cmp-cmdline",
--         "hrsh7th/nvim-cmp",
--         "L3MON4D3/LuaSnip",
--         "saadparwaiz1/cmp_luasnip",
--         "j-hui/fidget.nvim",
--     },
--     config = function()
--         local cmp_lsp = require("cmp_nvim_lsp")
--         local capabilities = vim.tbl_deep_extend(
--             "force",
--             {},
--             vim.lsp.protocol.make_client_capabilities(),
--             cmp_lsp.default_capabilities()
--         )

--         require("fidget").setup({})
--         require("mason").setup()
--         local lspconfig = require('lspconfig')

--         require('mason-lspconfig').setup({
--             ensure_installed = {
--                 "ts_ls",
--                 "lua_ls",
--                 "ruff"
--             },
--             handlers = {
--                 function(server_name)
--                     lspconfig[server_name].setup({
--                         capabilities = capabilities,
--                     })
--                 end,
--                 lua_ls = function()
--                     lspconfig.lua_ls.setup({
--                         capabilities = capabilities,
--                         settings = {
--                             Lua = {
--                                 runtime = {
--                                     version = 'LuaJIT'
--                                 },
--                                 diagnostics = {
--                                     globals = { 'vim', 'love' },
--                                 },
--                                 workspace = {
--                                     library = {
--                                         vim.env.VIMRUNTIME,
--                                     }
--                                 }
--                             }
--                         }
--                     })
--                 end,
--                 volar = function()
--                     lspconfig.volar.setup {
--                         filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
--                         init_options = {
--                             -- vue = {
--                             --     -- disable hybrid mode
--                             --     hybridMode = false,
--                             -- },
--                         },
--                     }
--                 end
--             }
--         })

--         local cmp = require('cmp')
--         local cmp_select = { behavior = cmp.SelectBehavior.Select }

--         -- this is the function that loads the extra snippets to luasnip
--         -- from rafamadriz/friendly-snippets
--         require('luasnip.loaders.from_vscode').lazy_load()

--         cmp.setup({
--             sources = {
--                 { name = 'path' },
--                 { name = 'nvim_lsp' },
--                 { name = 'buffer',  keyword_length = 3 },
--             },
--             mapping = cmp.mapping.preset.insert({
--                 -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--                 -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--                 ['<CR>'] = cmp.mapping.confirm({ select = true }),
--                 -- ['<C-Space>'] = cmp.mapping.complete(),
--             }),
--             snippet = {
--                 expand = function(args)
--                     require('luasnip').lsp_expand(args.body)
--                 end,
--             },
--         })
--     end
-- }
