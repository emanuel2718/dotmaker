require 'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = true,
  -- respect_buf_cwd     = true,
  filters             = {
    dotfiles = true,
    custom = { ".git/*", "node_modules", ".build", ".vscode" }
  },
  renderer            = {
    indent_markers = {
      enable = true,
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
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open         = {
    cmd  = nil,
    args = {}
  },

  view = {
    width = 40,
    side = 'left',
    number = false,
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = {
        { key = '<C-h>', action = 'dir_up' }
      }
    }
  }
}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}
