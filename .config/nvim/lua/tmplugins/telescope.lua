return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local map = require('rami.map')
    local opts = require('rami.opts')
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    map("n", "<leader>.", builtin.find_files, opts)
    map("n", "<leader>bi", builtin.buffers, opts)
    map("n", "<leader>fr", builtin.oldfiles, opts)
    map("n", "<leader>hh", builtin.help_tags, opts)
    map("n", "<leader>ht", builtin.colorscheme, opts)

    -- TODO: move this from here to a fzf.lua dedicated file
    map('n', '<leader>ss', '<cmd>FzfLua grep_curbuf<cr>', opts)
    map('n', '<leader>sP', '<cmd>FzfLua grep<cr>', opts)
    map('n', '<leader>sp', '<cmd>FzfLua live_grep<cr>', opts)
    map('n', '<leader>gs', '<cmd>FzfLua git_status<cr>', opts)
    map('n', '<leader>gc', '<cmd>FzfLua git_commits<cr>', opts)

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<C-x>"] = false,
            ["<C-u>"] = false,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<esc>"] = actions.close,
          },
          n = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["v"] = actions.file_vsplit,
            ["s"] = actions.file_split,
          },
        },
        file_ignore_patterns = {
          "vendor/*",
          "%.lock",
          "__pycache__/*",
          ".mypy_cache/*",
          "%.sqlite3",
          "%.ipynb",
          "node_modules/*",
          ".git/",
          "%.webp",
          ".github/",
          ".gradle/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "__pycache__/",
          "build/",
          "env/",
          "node_modules/",
          "target/",
          "%.pdb",
          "%.dll",
          "%.class",
          "%.exe",
          "%.cache",
          "%.dylib",
        },
      },
      pickers = {
        oldfiles = {
          sort_lastused = true,
          cwd_only = true,
          -- theme = "ivy",
          previewer = false,
        },
        colorscheme = {
          enable_preview = true,
        },
        help_tags = {
          previewer = false
        },
        buffers = {
          -- theme = "ivy",
          previewer = false,
        },
        live_grep = {
          -- theme = "ivy",
          previewer = false,
        },
        find_files = {
          previewer = false,
          hidden = true,
          -- theme = "ivy",
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--color",
            "never",
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    require("telescope").load_extension("fzf")
  end
}