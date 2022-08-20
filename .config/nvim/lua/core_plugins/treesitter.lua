require('nvim-treesitter.configs').setup{
  ensure_installed = 'all',
  sync_install = false,
  ingnore_install = false,
  highlight = {
    enable = true,
    disable = {''},
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = {'yaml'}},
  context_commentstring = {
    enable = true,
    enable_autocmd = true
  }
}
-- require('nvim-treesitter.configs').setup{

--   ensure_installed = {'c', 'cpp', 'python', 'lua', 'typescript',
--                       'regex', 'bash', 'cmake', 'css', 'javascript',
--                       'html', 'comment', 'java', 'rust', 'go', 'markdown',
--                       'make', 'json', 'vim'},
--   highlight = {
--     enable = true,
--     disable = {},
--   },

--   rainbow = {
--     enable = false,
--     -- disable = { 'jsx', 'cpp' },
--     extended_mode = true,
--     max_file_lines = nil,
--     -- colors = {},
--     -- termcolors = {}
--   },

--   autotag = {
--     enable = true,
--   },

--   refactor = {
--     smart_rename = {
--       enable = true,
--       keymaps = {
--         smart_rename = 'grr',
--       },
--     },
--     navigation = {
--       enable = true,
--       keymaps = {
--         goto_definition = 'gnd',
--         list_definitions = 'gnD',
--         list_definitions_toc = 'gO',
--         goto_next_usage = '<A-]>',
--         goto_previous_usage = '<A-[>',
--       },
--     },
--   },
-- }
