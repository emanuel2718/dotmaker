return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
      "danielfalk/smart-open.nvim",
      branch = "0.2.x",
      dependencies = { "kkharji/sqlite.lua" },
    },
  },
  config = function()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    -- Keymaps
    map("n", "<leader>.", builtin.find_files, opts)
    map("n", "<leader>,", builtin.oldfiles, opts)
    map("n", "<leader>sp", builtin.live_grep, opts)
    map("n", "<leader>ss", builtin.current_buffer_fuzzy_find, opts)
    map("n", "<leader>gs", builtin.git_stash, opts)
    map("n", "<leader>gc", builtin.git_commits, opts)
    map("n", "<leader>bi", builtin.buffers, opts)
    map("n", "<leader>ht", builtin.colorscheme, opts)
    map("n", "<leader>hh", builtin.help_tags, opts)
    map("n", "<C-p>", function()
      require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
    end, opts)

    require("telescope").setup({
      defaults = {
        prompt_prefix = "> ",
        selection_caret = " ",
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
          theme = "ivy",
          previewer = false,
        },
        colorscheme = {
          enable_preview = true,
          theme = "ivy",
        },
        find_files = {
          previewer = false,
          hidden = true,
          theme = "ivy",
          find_command = {
            "rg",
            "--files",
            "--color",
            "never",
          },
        },
        buffers = {
          theme = "ivy",
          previewer = false,
        },
        live_grep = {
          theme = "ivy",
          path_display = { "shorten" },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        smart_open = {
          show_scores = true,
          match_algorithm = "fzf",
          ignore_patterns = { "*.git/*", "*/tmp/*", "node_modules/*", "dist/*" },
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("smart_open")
    require("telescope").load_extension("smart_open")
  end,
}
