return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' }
  },
  config = function()
    local map = require('rami.utils').map
    local actions = require("telescope.actions")
    local builtin = require 'telescope.builtin'

    require('telescope').setup {
      -- defaults = {
      --   mappings = {
      --     i = {
      --       ["<C-x>"] = false,
      --       ["<C-u>"] = false,
      --       ["<C-k>"] = actions.move_selection_previous,
      --       ["<C-j>"] = actions.move_selection_next,
      --       ["<esc>"] = actions.close,
      --     },
      --     n = {
      --       ["<C-k>"] = actions.move_selection_previous,
      --       ["<C-j>"] = actions.move_selection_next,
      --       ["v"] = actions.file_vsplit,
      --       ["s"] = actions.file_split,
      --     },
      --   },
      -- },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        }
      }
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    map('n', '<leader>.', function()
      builtin.find_files {
        hidden = false,
        previewer = false,
        winblend = 10
      }
    end)

    map('n', '<leader>fo', function() builtin.oldfiles { previewer = false, sorting_strategy = 'descending' } end)
    map('n', '<leader>ss', builtin.builtin)
    map('n', '<leader>sr', builtin.resume)
    map('n', '<leader>sd', builtin.diagnostics)


    map('n', '<leader>hh', builtin.help_tags)
    map('n', '<leader>ht', builtin.colorscheme)
    map('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end)

    map('n', '<leader>sp', function() builtin.live_grep { previewer = false } end)
    map('n', '<leader>s.', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end)

    -- Search Neovim config
    map('n', '<leader>sn', function()
      builtin.find_files {
        cwd = vim.fn.stdpath 'config',
        shorten_path = false,
        prompt_title = 'NVIM',
        layout_strategy = "horizontal",
        layout_config = {
          preview_width = 0.35,
        },
      }
    end)
  end
}
