require 'lualine'.setup {
  options = {
    -- icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true,
      newfile_status = true,
      path = 3,
      shorting_target = 40,
    } },
    lualine_x = { 'filetype' },
    lualine_y = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        color_error = '#BF616A',
        color_warn = '#EBCB8B',
        color_info = '#88C0D0',
        color_hint = '#3A4151',
      },
    },
    lualine_z = { 'location' }
  },
}
