local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local map = vim.keymap.set


require('telescope').setup {
  extensions = {
    fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
  },
  defaults = {
    path_display = { 'truncate' },
    file_ignore_patterns = { 'node_modules', 'package-lock.json', 'yarn.lock' },
    initial_mode = 'insert',
    mappings = {
      i = {
        ['<C-x>'] = false,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<esc>"] = actions.close
      },
      n = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  },
  pickers = {
    -- colorscheme = {
    --   enable_preview = true,
    -- },
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  },
}
-- require("telescope").load_extension("ui-select")

map('n', '<leader>.', builtin.find_files)
map('n', '<leader>pf', builtin.git_files)
map('n', '<leader>fr', builtin.oldfiles)
map('n', '<leader>sr', builtin.lsp_references)
map('n', '<leader>si', builtin.lsp_document_symbols)
map('n', '<leader>s.', builtin.grep_string)
map('n', '<leader>sp', builtin.live_grep)
map('n', '<leader>ss', builtin.current_buffer_fuzzy_find)
map('n', '<leader>sd', builtin.diagnostics)
map('n', '<leader>ht', builtin.colorscheme)
map('n', '<leader>bb', ':Telescope buffers<CR>')
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

pcall(require('telescope').load_extension, 'fzf')
