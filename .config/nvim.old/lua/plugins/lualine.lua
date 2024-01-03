return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        -- icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
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
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            color_error = "#BF616A",
            color_warn = "#EBCB8B",
            color_info = "#88C0D0",
            color_hint = "#3A4151",
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_satus = true,
            path = 3,
            shorting_target = 40,
          }
        },
        lualine_x = { "filetype" },
        lualine_y = { "branch" },
        lualine_z = { "location" },
      },
    })
    -- require("lualine").setup({
    --   options = {
    --     icons_enabled = true,
    --     theme = "auto",
    --     component_separators = { left = "", right = "" },
    --     section_separators = { left = "", right = "" },
    --     disabled_filetypes = {
    --       statusline = {},
    --       winbar = {},
    --     },
    --     ignore_focus = {},
    --     always_divide_middle = true,
    --     globalstatus = false,
    --     refresh = {
    --       statusline = 1000,
    --       tabline = 1000,
    --       winbar = 1000,
    --     },
    --   },
    --   sections = {
    --     lualine_a = { "mode" },
    --     lualine_b = { "branch", "diff", "diagnostics" },
    --     lualine_c = { "filename" },
    --     lualine_x = { "encoding", "fileformat", "filetype" },
    --     lualine_y = { "progress" },
    --     lualine_z = { "location" },
    --   },
    --   inactive_sections = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = { "filename" },
    --     lualine_x = { "location" },
    --     lualine_y = {},
    --     lualine_z = {},
    --   },
    --   tabline = {},
    --   winbar = {},
    --   inactive_winbar = {},
    --   extensions = {},
    -- })
  end,
}
