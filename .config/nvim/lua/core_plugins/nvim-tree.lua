require 'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  hijack_directories  = {
    enable = false,
  },
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  update_cwd          = true,
  respect_buf_cwd     = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  filters             = {
    dotfiles = true,
    custom = { ".git/*", "node_modules", ".build", ".vscode" }
  },
  renderer            = {
    indent_markers = {
      enable = true,
    },
    highlight_git = true,
    icons = {
      web_devicons = true,
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          default = "",
          open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = ",",
          ignored = "◌",
        },
      },
    }
  },
  diagnostics         = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    }
  },
  actions             = {
    open_file = {
      quit_on_open = true,
    },
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open         = {
    cmd  = nil,
    args = {}
  },

  view = {
    -- width = 40,
    adaptive_size = true,
    side = 'left',
    number = false,
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = {
        { key = '<C-h>', action = 'dir_up' },
        { key = 'l', action = '<CR>' },
        { key = 'h', action = 'close_node' }
      }
    }
  },

}

-- vim.g.nvim_tree_icons = {
--   default = "",
--   symlink = "",
--   git = {
--     unstaged = "",
--     staged = "S",
--     unmerged = "",
--     renamed = "➜",
--     deleted = "",
--     untracked = "U",
--     ignored = "◌",
--   },
--   folder = {
--     default = "",
--     open = "",
--     empty = "",
--     empty_open = "",
--     symlink = "",
--   },
-- }
