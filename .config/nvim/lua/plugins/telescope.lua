-- return {}
return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    pcall(require("telescope").load_extension, "fzf")

    local builtin = require('telescope.builtin')
    local utils = require('core.utils')
    vim.keymap.set('n', '<leader>f.', builtin.git_files, { desc = 'Telescope find git tracked files' })
    vim.keymap.set('n', '<leader>.', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = 'Telescope recent files' })
    vim.keymap.set('n', '<leader>sp', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set("n", "<leader>ss", builtin.resume, { desc = 'Telescope resume ' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>ht', builtin.colorscheme, { desc = 'Telescope colorschemes' })
    vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
    vim.keymap.set("n", "<space>fg", utils.telescope_multi_rg)
    vim.keymap.set("n", "<space>s.", builtin.grep_string)
    vim.keymap.set("v", "<space>s.", builtin.grep_string)
  end
}
