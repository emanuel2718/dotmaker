-- return {}
return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local map = vim.keymap.set
    local fzf = require 'fzf-lua'
    local opts = {
      { "fzf-vim", "max-perf" },
      keymap  = {
        fzf = {
          ["alt-h"] = "toggle-preview",
        },
      },
      winopts = {
        preview = {
          hidden = "hidden",
        },
      },
      lsp     = {
        code_actions = {
          previewer = false,
          winopts = { height = 0.5, width = 0.5 },
        },
      },
      grep    = {
        hidden = true,
      }

    }

    fzf.setup(opts)
    fzf.register_ui_select()
    --
    -- map('n', '<leader>.', fzf.files)
    -- map('n', '<leader>fo', fzf.oldfiles)
    -- map('n', '<leader><leader>', fzf.buffers)
    -- map('n', '<leader>/', fzf.blines)
    -- map('n', '<leader>sp', fzf.live_grep)
    -- map('v', '<leader>s.', fzf.grep_visual)
    -- map('n', '<leader>sl', fzf.live_grep_resume)
    --
    -- -- git
    -- map('n', '<leader>gs', fzf.git_status)
    -- map('n', '<leader>gc', fzf.git_commits)
    -- map('n', '<leader>gh', fzf.git_bcommits)
    -- map('n', '<leader>gH', fzf.git_commits)
    --
    --
    --
    --
    -- map('n', '<leader>s.', fzf.grep_cWORD)
    -- map('n', '<leader>ss', fzf.spell_suggest)
    -- map('n', '<leader>r.', fzf.resume)
    -- map('n', '<leader>ht', fzf.colorschemes)
    -- map('n', '<leader>hh', fzf.helptags)
  end
}
