return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        picker = {
            -- prompt = " ",
            -- layout = {
            --     cycle = true,
            --     --- Use the default layout or vertical if the window is too narrow
            --     preset = function() return vim.o.columns >= 120 and "default" or "vertical" end,
            -- },
        },
        treesitter = {},
        explorer = {},
        scope = {
            enabled = true,
            cursor = false,
            treesitter = {
                enabled = true,
                blocks = {
                    "chunk",
                    "table_constructor",
                    "function_declaration",
                    "function_definition",
                    "method_declaration",
                    "method_definition",
                    "class_declaration",
                    "class_definition",
                    "do_statement",
                    "while_statement",
                    "repeat_statement",
                    "switch_statement",
                    "case_statement",
                    "if_statement",
                    "for_statement",
                    "arguments",
                },
            },
        },
        bigfile = {
            enabled = true,
            ---@param ctx {buf: number, ft:string}
            setup = function(ctx)
                Snacks.util.wo(0, {
                    foldmethod = "manual",
                    statuscolumn = "",
                    conceallevel = 0,
                })
                vim.b.minianimate_disable = true
                vim.opt_local.swapfile = false
                vim.opt_local.foldmethod = "manual"
                vim.opt_local.undoreload = 0
                vim.opt_local.list = false

                vim.cmd("syntax clear")
                vim.opt_local.syntax = "OFF"
            end,
        },
    },
    keys = {
        -- files
        { "<leader><leader>", function() Snacks.picker.smart() end },
        { "<leader>f.",       function() Snacks.picker.git_files() end },
        { "<leader>.",        function() Snacks.picker.files({ hidden = true }) end },
        { "<leader>fr",       function() Snacks.picker.recent() end },
        { "<leader>b",        function() Snacks.picker.buffers({ layout = { preset = "select" } }) end },
        { "<leader>c.",       function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end },
        { "<C-e>",            function() Snacks.explorer({ layout = { layout = { position = "right" } } }) end },

        -- search
        { "<leader>sh",       function() Snacks.picker.search_history() end },
        { "<leader>sp",       function() Snacks.picker.grep() end },
        { "<leader>ss",       function() Snacks.picker.grep_word() end },
        { "<leader>s.",       function() Snacks.picker.treesitter() end }, -- symbols (?) pog
        { "<leader>r.",       function() Snacks.picker.resume() end },

        -- docs
        { "<leader>hh",       function() Snacks.picker.help() end },
        { "<leader>mm",       function() Snacks.picker.man() end },

        -- git
        { "<leader>gd",       function() Snacks.picker.git_diff() end },
        { "<leader>gl",       function() Snacks.picker.git_log() end },
        { "<leader>gs",       function() Snacks.picker.git_status() end },
        { "<leader>gb",       function() Snacks.picker.git_log_line() end },

        -- diagnostics
        { "<leader>ld",       function() Snacks.picker.diagnostics() end },

        -- misc
        { "<leader>pp",       function() Snacks.picker() end },
        { "<leader>ht",       function() Snacks.picker.colorschemes() end },
        { "<leader>:",        function() Snacks.picker.command_history() end },

    }

}
