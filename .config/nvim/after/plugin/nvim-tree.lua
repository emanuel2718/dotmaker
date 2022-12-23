require 'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    hijack_unnamed_buffer_when_opening = false,
    hijack_cursor       = true,


    -- hijack_directories  = {
    --   enable = false,
    -- },
    open_on_setup       =  true,
    ignore_ft_on_setup  = {},
    open_on_tab         = false,
    update_cwd          = true,
    respect_buf_cwd     = true,
    update_focused_file = {
      enable = true,
      update_cwd = false,
      ignore_list = {},
    },
    filters             = {
      dotfiles = true,
      custom = { ".git/*", "node_modules", ".build", ".vscode" }
    },
    filesystem_watchers = {
      enable = true,
    },
    renderer            = {
      indent_markers = {
        enable = false,
      },
      highlight_git = false,
      highlight_opened_files = "none",
      icons = {
        -- web_devicons = true,
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
        resize_window = true,
        quit_on_open = true,
      },
    },
    -- update_focused_file = {
    --   enable      = true,
    --   update_cwd  = true,
    --   ignore_list = {}
    -- },
    system_open         = {
      cmd  = nil,
      args = {}
    },

    view = {
      adaptive_size = true,
      width = 45,
      side = 'left',
      number = false,
      hide_root_folder = true,
      mappings = {
        custom_only = false,
        list = {
          { key = '<C-h>', action = 'dir_up' },
          { key = 'l', action = '<CR>' },
          { key = 'h', action = 'close_node' },
          { key = 'H', action = 'toggle_dotfiles' }
        }
      }
    },
  }