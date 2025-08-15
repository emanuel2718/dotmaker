vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
local map = vim.keymap.set
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
-- show numbers
opt.number = true
-- I got used to from emacs days
opt.cursorline = true
-- don't lie to me about line breaks
opt.wrap = false
-- keep some buffer of space while scrolling vertically
opt.scrolloff = 10
-- keep some buffer of space while scrolling horizontally
opt.sidescrolloff = 8
-- who needs swap(?)
opt.swapfile = false
-- infinite undo ftw
opt.undofile = true
-- case insesitive search/replace by default
opt.ignorecase = true
-- respect uppercase sensibilities when using them
opt.smartcase = true
-- show partial results in a preview window
opt.inccommand = "split"
-- i'm liking folds nowadays
opt.foldenable = true
-- best fold method in the market
opt.foldmethod = "indent"
-- i don't like automatic folds
opt.foldlevel = 99
--  tabs stuff
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
-- top + left splitting
opt.splitright = true
opt.splitbelow = true
-- we like the mouse around here
opt.mouse = "a"
-- indenting rules
opt.autoindent = true
opt.copyindent = true
opt.breakindent = true
-- prevents the buffer from moving when addings/removing signs
opt.signcolumn = "yes"
-- helps performance when searching yuge files
opt.synmaxcol = 300
-- list all matches while only completing the longest common match
opt.wildmode = "list:longest"
-- ain't nobody want to open a picture or swp file with vim
opt.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site"
-- better diffs
opt.diffopt:append("iwhite")
-- column to keep me away from long lines
opt.colorcolumn = "100"
-- show hidden characters
opt.list = true
opt.listchars = "tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•"

-- show path in winbar
opt.winbar = "%=%m %f"

-- opt.updatetime = 50
-- opt.timeoutlen = 300

-------------------------------------------------------------------------------
-- Mappings
-------------------------------------------------------------------------------
-- split
map("n", "<leader>n", "<cmd>split<cr>")
map("n", "<leader>m", "<cmd>vsplit<cr>")

-- movement
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-h>", "<c-w><c-h>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- movement, but center me after
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- resize
map("n", "<Left>", "<c-w>5<")
map("n", "<Right>", "<c-w>5>")
map("n", "<Up>", "<C-W>+")
map("n", "<Down>", "<C-W>-")

-- move highlighted lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Multiple indent commands
map("v", "<", "<gv")
map("v", ">", ">gv")

-- respect system clipboard
map("v", "<leader>y", [["+y]])
map("n", "<leader>y", [["+Y]])

-- quit
map("n", "<leader>q", "<cmd>qa!<cr>")

-- save
map("n", "<leader>w", "<cmd>w!<cr>")

-- close buffer
map("n", "<leader>o", "<cmd>q<cr>")

-- last buffer
map("n", "<leader>`", "<cmd>e #<cr>")

-- send nvim to the foreground
map("n", "<C-g>", "<C-z>")

-- highlight every line in the buffer
map("n", "<leader>a", "VggoG")

-- source current lua file
map("n", "<leader>x", "<cmd>source %<CR>")

-- don't yank pasted over text
map("v", "p", '"_dP')

-- use <leader><tab> for toggling folds
map("n", "<leader><Tab>", "za")

-- always center search results
map("n", "n", "nzz", { silent = true })
map("n", "N", "Nzz", { silent = true })
map("n", "*", "*zz", { silent = true })
map("n", "#", "#zz", { silent = true })
map("n", "g*", "g*zz", { silent = true })

-- clear search highlights with <Esc>
map("n", "<Esc>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<Esc>"
  end
end, { expr = true })

-- neat mapping to change current working dir
map("n", "<leader>c.", function()
  local start = vim.fn.expand("%:p:h")
  local cwd = vim.fn.input("Change cwd to: ", start, "dir")
  if cwd ~= nil and cwd ~= "" then
    vim.cmd("lcd " .. cwd)
    print(vim.fn.getcwd())
  end
end, { desc = "change cwd" })

-------------------------------------------------------------------------------
-- Autocommands
-------------------------------------------------------------------------------
-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = "250",
    })
  end,
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

-- close with `q`
autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = { "help", "lspinfo", "man", "fugitive", "checkhealth", "oil" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- disable everything when editing/reading a large file
-- ref: https://vi.stackexchange.com/a/169/15292
autocmd("BufReadPre", {
  group = augroup("large_file", { clear = true }),
  pattern = "*",
  desc = "optimize for large file",
  callback = function(ev)
    local file_size_limit = 524288 -- 0.5MB
    local f = ev.file

    if vim.fn.getfsize(f) > file_size_limit or vim.fn.getfsize(f) == -2 then
      print("NOTE: setting file as big question mark")
      vim.o.eventignore = "all"

      -- show ruler
      vim.o.ruler = true

      vim.wo.number = false
      vim.wo.cursorline = false

      vim.bo.swapfile = false
      vim.bo.bufhidden = "unload"
      vim.bo.undolevels = -1
    end
  end,
})

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local PLUG = {
  -- plugins/theme/tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- plugins/theme/oneokai
  {
    "AxelGard/oneokai.nvim",
    config = function()
      require("oneokai").setup({
        style = "dark",
      })
      -- require("oneokai").load()
    end,
  },
  -- plugins/statusline
  {
    "windwp/windline.nvim",
    config = function()
      require("wlsample.airline")
    end,
  },
  -- plugins/term
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
    },
    keys = {
      { "<C-t>", "<cmd>ToggleTerm<cr>", mode = "n" },
      { "<C-t>", "<cmd>ToggleTerm<cr>", mode = "t" },
    },
  },
  -- plugins/oil
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["q"] = "actions.close",
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
      })
      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>")

      -- Open parent directory in floating window
      vim.keymap.set("n", "<space>-", require("oil").toggle_float)
    end,
  },
  -- plugins/fzf
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<leader>sp", "<cmd>FzfLua live_grep_native<cr>", desc = "Grep" },
      { "<leader>s.", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word under cursor" },
      { "<leader>/", "<cmd>FzfLua grep_curbuf<cr>", desc = "Grep current buffer" },
      { "<leader>su", "<cmd>FzfLua grep_cword<cr>", desc = "Grep WORD under cursor" },
      { "<leader>.", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>of", "<cmd>FzfLua oldfiles<cr>", desc = "Old files" },
      { "<leader><leader>", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },

      { "<leader>ss", "<cmd>FzfLua spell_suggest<cr>", desc = "Spell suggest" },
      { "<leader>ft", "<cmd>FzfLua filetypes<cr>", desc = "Change file-types" },
      { "<leader>km", "<cmd>FzfLua keymaps<cr>", desc = "View keymaps" },

      { "<leader>ch", "<cmd>FzfLua command_history<cr>", desc = "Command history" },
      { "<leader>sh", "<cmd>FzfLua search_history<cr>", desc = "Search history" },
      { "<leader>hh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
      { "<leader>hg", "<cmd>FzfLua highlights<cr>", desc = "Highlights" },

      { "<leader>sc", "<cmd>FzfLua git_bcommits<cr>", desc = "Source control commits" },

      {
        "<leader>sn",
        function()
          local current_file = vim.fn.expand("%:t:r") -- filename w/o extension
          if current_file ~= "" then
            require("fzf-lua").grep({ search = current_file })
          end
        end,
        desc = "Search fileName",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
      })
      vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")
      vim.keymap.set("n", "<leader>gh", ":Gitsigns blame<cr>")
      vim.keymap.set("n", "<leader>gj", ":Gitsigns next_hunk<cr>")
      vim.keymap.set("n", "<leader>gk", ":Gitsigns prev_hunk<cr>")
    end,
  },
  -- plugins/mini/icons
  { "echasnovski/mini.icons", lazy = true, opts = {} },
  -- plugins/mini/diff
  -- { "echasnovski/mini.diff",  event = "VeryLazy", opts = { view = { style = "sign" } } },
  -- plugins/mini/hipatterns
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    opts = function()
      local hi = require("mini.hipatterns")
      return {
        highlighters = {
          hex_color = hi.gen_highlighter.hex_color(),

          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "DiagnosticError" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "DiagnosticWarn" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "DiagnosticInfo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "DiagnosticHint" },
          bug = { pattern = "%f[%w]()BUG()%f[%W]", group = "DiagnosticError" },
          warn = { pattern = "%f[%w]()WARN()%f[%W]", group = "DiagnosticWarn" },
          perf = { pattern = "%f[%w]()PERF()%f[%W]", group = "DiagnosticWarn" },
          doc = { pattern = "%f[%w]()DOC()%f[%W]", group = "DiagnosticWarn" },
          sec = { pattern = "%f[%w]()SEC()%f[%W]", group = "DiagnosticError" },
          rev = { pattern = "%f[%w]()REV()%f[%W]", group = "DiagnosticInfo" },
          test = { pattern = "%f[%w]()TEST()%f[%W]", group = "DiagnosticInfo" },
          deprecated = { pattern = "%f[%w]()DEPRECATED()%f[%W]", group = "DiagnosticDepreciated" },
          design = { pattern = "%f[%w]()DESIGN()%f[%W]", group = "DiagnosticWarn" },
          verify = { pattern = "%f[%w]()VERIFY()%f[%W]", group = "DiagnosticWarn" },
          idea = { pattern = "%f[%w]()IDEA()%f[%W]", group = "DiagnosticHint" },
        },
      }
    end,
  },
  -- plugins/snacks.nvim
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      input = { enabled = true },
      git = { enabled = true },
      lazygit = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gl",
        function()
          Snacks.picker.git_log_file()
        end,
        desc = "Git Log File",
      },
    },
  },
  -- plugins/colorizer
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          names = false,
          RGB = true, -- #RGB hex codes
          RGBA = true, -- #RGBA hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          AARRGGBB = true, -- 0xAARRGGBB hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          tailwind = true,
        },
      })
      vim.keymap.set("n", "<leader>ci", "<cmd>ColorizerToggle<cr>")
    end,
  },
  -- plugins/treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 5, multiline_threshold = 1 } },
    },
    build = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    opts = {
      indent = { enable = true },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          ---@diagnostic disable-next-line: undefined-field
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if lang == "help" then
            return true
          end
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      additional_vim_regex_highlighting = false,
      auto_install = true,
      ensure_installed = {
        "bash",
        "css",
        "c",
        "cpp",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "php",
        "python",
        "rust",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "sql",
        "toml",
        "typescript",
        "nix",
        "vue",
        "xml",
        "yaml",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@function.inner"] = "V", -- linewise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "V", -- linewise
            ["@class.inner"] = "V", -- linewise
            ["@parameter.outer"] = "v", -- charwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          include_surrounding_whitespace = false,
        },
      },
    },
  },
  -- plugins/trouble
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>x.",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
    },
  },
  -- plugins/blink.cmp
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "*",
    opts = {
      keymap = { preset = "default" },
      sources = { default = { "lsp", "path", "buffer" } },
    },
  },
  -- plugins/conform
  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        json = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
        lua = { "stylua" },
        html = { "prettierd" },
        hbs = { "prettierd" },
        xhtml = { "prettierd" },
        markdown = { "prettierd" },
        nix = { "nixpkgs-fmt" },
        php = { "prettierd" },
        python = { "ruff" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        vue = { "prettierd" },
        typescriptreact = { "prettierd" },
        yaml = { "prettierd" },
        toml = { "taplo" },
        -- rust = { "rustfmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
  -- plugins/lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neodev.nvim" },
      {
        "mason-org/mason.nvim",
        lazy = false,
        config = function()
          require("mason").setup({
            ui = {
              check_outdated_packages_on_open = true,
              auto_update_packages = true,
            },
          })
        end,
      },
      {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {},
            automatic_installation = false, -- MUST BE FALSE [dup issue]
            automatic_setup = false, -- Disable automatic server setup
            automatic_enable = false, -- but never auto‑attaches
            handlers = nil,
          })
        end,
      },
    },
    opts = {
      servers = {
        bashls = {},
        emmet_language_server = {},
        cssls = {},
        html = {},
        lemminx = {},
        yamlls = {},
        vtsls = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          settings = {
            vtsls = { tsserver = { globalPlugins = {} } },
          },
          before_init = function(_, config)
            table.insert(config.settings.vtsls.tsserver.globalPlugins, {
              name = "@vue/typescript-plugin",
              location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
              languages = { "vue" },
              configNamespace = "typescript",
              enableForWorkspaceTypeScriptVersions = true,
            })
          end,
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
        tailwindcss = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              diagnostics = {
                enable = false,
              },
              cargo = {
                features = "all",
              },
              checkOnSave = true,
              check = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              imports = {
                group = {
                  enable = false,
                },
              },
              completion = {
                postfix = {
                  enable = false,
                },
              },
            },
          },
        },
        lua_ls = {
          on_init = function(client)
            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
              workspace = { library = { vim.env.VIMRUNTIME } },
            })
          end,
          settings = { Lua = {} },
        },
        phpactor = {},
        ruff = {},
        taplo = {},
      },
    },
    inlay_hints = {
      enabled = false,
    },

    config = function(_, opts)
      for server, settings in pairs(opts.servers) do
        vim.lsp.config(server, settings)
        vim.lsp.enable(server)
      end

      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
          source = "if_many",
          spacing = 4,
        },
        float = {
          source = "if_many",
          border = "rounded",
        },
        signs = false,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[lsp] hover docs" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[lsp] implementation" })
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[lsp] references" })
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[lsp] definition" })
      vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<cr>", { desc = "[lsp] references" })
      vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "[lsp] definition" })

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[lsp] declaration" })
      vim.keymap.set("n", "gn", vim.lsp.buf.rename, { desc = "[lsp] rename symbol" })
      -- vim.keymap.set("i", "<C-,>", vim.lsp.buf.signature_help, { desc = "[lsp] signature help" })
      -- vim.keymap.set("n", "<C-,>", vim.lsp.buf.signature_help, { desc = "[lsp] signature help" })

      vim.keymap.set("n", "<leader>ll", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "[lsp] document symbols" })
      vim.keymap.set("n", "<leader>ls", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "[lsp] workspace symbols" })
      vim.keymap.set("n", "<C-c>", "<cmd>FzfLua lsp_code_actions<CR>", { desc = "[lsp] code actions" })
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "[diag] hover line" })

      vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "[diag] hover line" })

      vim.keymap.set("n", "<leader>k", function()
        vim.diagnostic.jump({ count = -1 })
      end, { desc = "[diag] previous" })
      vim.keymap.set("n", "<leader>j", function()
        vim.diagnostic.jump({ count = 1 })
      end, { desc = "[diag] next" })

      vim.keymap.set("n", "<leader>dd", function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
      end, { silent = true, noremap = true, desc = "[lsp] diag ON|OFF" })

      vim.keymap.set("n", "<leader>v", function()
        vim.cmd("vsplit | lua vim.lsp.buf.definition()")
        vim.cmd("norm zz")
      end)
    end,
  },
  -- plugins/lsp-signature
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, _)
      -- Get signatures (and _only_ signatures) when in argument lists.
      local lsp_signature = require("lsp_signature")
      lsp_signature.setup({
        doc_lines = 0,
        floating_window = false,
        floating_window_above_cur_line = false,
        handler_opts = {
          -- border = "none",
          border = "rounded",
        },
        hint_enable = false,
        -- hint_prefix = {
        --   above = "↙ ", -- when the hint is on the line above the current line
        --   current = "← ", -- when the hint is on the same line
        --   below = "↖ ", -- when the hint is on the line below the current line
        -- },
      })

      vim.keymap.set({ "n", "i" }, "<C-s>", function()
        lsp_signature.toggle_float_win()
      end, { silent = true, noremap = true, desc = "toggle signature" })
    end,
  },
  -- plugins/rust.vim
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    config = function()
      vim.g.rustfmt_autosave = 1
      vim.g.rustfmt_emit_files = 1
      vim.g.rustfmt_fail_silently = 0
      vim.g.rust_clip_command = "wl-copy"
    end,
  },
}

require("lazy").setup(PLUG, {
  change_detection = {
    notify = false,
  },
})
