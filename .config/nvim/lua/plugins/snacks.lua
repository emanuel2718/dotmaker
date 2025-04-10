return {
  'folke/snacks.nvim',
  lazy = false,
  --@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    git = { enabled = true },
  },
  keys = {
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    { "<leader>gs", function() Snacks.picker.git_status() end,   desc = "Git Status" },
    { "<leader>gl", function() Snacks.picker.git_log() end,      desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>g.", function() Snacks.git.blame_line() end,      desc = "Git Blame" },
  }
}
