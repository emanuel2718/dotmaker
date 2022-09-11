require('toggleterm').setup{
  size = 15,
  open_mapping = '<F1>',
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  insert_mappings = false,
  persist_size = true,
  direction = 'horizontal',
  float_opts = { border = 'rounded', winblend = 3 },
  close_on_exit = true,
  shell = vim.o.shell, -- change the default shell
}