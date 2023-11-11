return {
   "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-rg.nvim",           lazy = true },
    { "nvim-telescope/telescope-node-modules.nvim", lazy = true },
    -- { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
  },
  config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      -- local fb_actions = require "telescope._extensions.file_browser.actions"
      telescope.setup({
        defaults = {
          prompt_prefix = '> ',
          selection_caret = ' ',
          winblend = 0,
          vimgrep_arguments = {
            "rg",
            "--ignore",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
          },
          file_ignore_patterns = {
              'vendor/*',
              '%.lock',
              '__pycache__/*',
              '%.sqlite3',
              '%.ipynb',
              'node_modules/*',
              '.git/',
              '%.webp',
              '.github/',
              '.gradle/',
              '.idea/',
              '.settings/',
              '.vscode/',
              '__pycache__/',
              'build/',
              'env/',
              'node_modules/',
              'target/',
              '%.pdb',
              '%.dll',
              '%.class',
              '%.exe',
              '%.cache',
              '%.dylib',
          },
          mappings = {
            i = {
              ["<C-x>"] = false,
              ["<C-u>"] = false,
              ["<C-k>"] = false,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<esc>"] = actions.close,
            },
            n = {
              ["<C-k>"] = false,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["v"] = actions.file_vsplit,
              ["s"] = actions.file_split,
            },
          },
        },
        pickers = {
          colorscheme = {
            enable_preview = true,
            theme = 'ivy',
          },
          find_files = {
            disable_devicons = true,
            theme = 'ivy',
          },
          oldfiles = {
            disable_devicons = true,
            theme = 'ivy',
          },
          live_grep = {
            disable_devicons = true,
            theme = 'ivy',
          },
          buffers = {
            disable_devicons = true,
            theme = 'ivy',
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          -- file_browser ={
          --   theme = 'ivy',
          --   hijack_netrw = true,
          --     mappings = {
          --       ["i"] = {
          --         ["<C-n>"] = false,
          --         ["<C-n>"] = fb_actions.create,
          --         ["<C-r>"] = fb_actions.rename,
          --         ["<C-d>"] = fb_actions.remove,
          --         ["<C-h>"] = fb_actions.backspace,
          --         ["<C-.>"] = fb_actions.toggle_hidden,
          --         -- your custom insert mode mappings
          --       },
          --       ["n"] = {
          --         -- your custom normal mode mappings
          --       },
          --   },
          -- }
        },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("node_modules")
      telescope.load_extension('harpoon')
      -- telescope.load_extension("file_browser")



      -- QUICKFIX: telescope breaks folds, this is a workaround (https://github.com/nvim-telescope/telescope.nvim/issues/699#issuecomment-1745374486)
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.opt.foldmethod:get() == "expr" then
            vim.schedule(function()
              vim.opt.foldmethod = "expr"
            end)
          end
        end,
      })

  end,
  enabled = true
}
