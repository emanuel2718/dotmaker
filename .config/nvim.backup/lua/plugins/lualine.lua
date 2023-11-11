return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      components_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      theme = "auto",
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "buffers" },
      lualine_c = { "diagnostics" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },

    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    -- extensions = { "fugitive", "nvim-tree", "trouble" },
  },

}
