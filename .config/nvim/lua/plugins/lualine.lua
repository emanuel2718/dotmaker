return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn' },
        symbols = { error = ' ', warn = ' ' },
        colored = true,
        update_in_insert = false,
        always_visible = true,
    }
    require("lualine").setup({
      options = {
        component_separators = {},
        globalstatus = true,
        section_separators = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", diagnostics },
        lualine_c = { {"filename", file_status = true, path = 1, shorting_target = 35 }},
        lualine_x = { {"filetype"}, { "filesize"}},
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
