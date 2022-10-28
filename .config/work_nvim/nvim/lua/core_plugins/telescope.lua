local actions = require('telescope.actions')

require('telescope').setup({
  pickers = {
    find_files = {
      theme = 'ivy'
    },
    git_files = {
      theme = 'ivy'
    },
    live_grep = {
      theme = 'ivy'
    },
    oldfiles = {
      theme = 'ivy'
    },
    current_buffer_fuzzy_find = {
      theme = 'ivy'
    },
    buffers = {
      theme = 'ivy'
    },
    git_status = {
      theme = 'ivy'
    },
    git_branches = {
      theme = 'ivy'
    },
  },
	defaults = {
		file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = " ",
    selection_caret = "> ",
    path_display = { "smart" },
		color_devicons = true,
    file_ignore_patterns = { 'node_modules', 'git' },
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
		grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

		mappings = {
			i = {
				['<C-x>'] = false,
				['<C-q>'] = actions.send_to_qflist,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<esc>'] = actions.close,
        ['<C-/>'] = actions.which_key,
        ["<c-d>"] = require("telescope.actions").delete_buffer,
			},
      n = {
        ['<c-d>'] = require('telescope.actions').delete_buffer

      }
		},
	},
	-- extensions = {
	-- 	fzy = {
	--             fuzzy = true,
	-- 		override_generic_sorter = false,
	-- 		override_file_sorter = true,
	--             case_mode = 'smart_case',
	-- 	},
	-- },
})
