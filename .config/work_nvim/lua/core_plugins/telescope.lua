local actions = require('telescope.actions')

require('telescope').setup({
	defaults = {
		file_sorter = require('telescope.sorters').get_fzy_sorter,
		prompt_prefix = '  ',
		color_devicons = true,
    file_ignore_patterns = { 'node_modules' },
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