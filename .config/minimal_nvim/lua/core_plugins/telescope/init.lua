local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt = ' >',
    color_devicons = true,

    file_previewer =    require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer =    require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer =  require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
	  n = {
		["C-x"] = true
	  },


      i = {
		["<C-h>"] = function() vim.cmd ":norm! h" end,
		["<C-l>"] = function() vim.cmd ":norm! l" end,
		["<C-a>"] = function() vim.cmd ":norm! A" end,
		["<C-i>"] = function() vim.cmd ":norm! I" end,
        -- ["<C-x>"] = true,
        -- ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

local M = {}

M.search_dotmaker = function()
  require('telescope.builtin').find_files({
	prompt_title = '<Dotmaker>',
	cwd = '~/git/dotmaker/',
	hidden = true,
  })
end

return M
