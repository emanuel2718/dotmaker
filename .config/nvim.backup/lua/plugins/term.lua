return {
  "numToStr/FTerm.nvim",
  keys = {
    { "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>',            mode = "n", desc = "toggle floatterm" },
    { "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "toggle floatterm" },
  },
  config = function()
    -- display
    require("FTerm").setup({
      border = "rounded",
      blend = 10, -- a little transparent
    })

    -- build
    vim.api.nvim_create_user_command("PBuild", function()
      require("FTerm").scratch({ cmd = { "pnpm", "build" } })
      vim.cmd("LspRestart")
    end, { bang = true })

    -- test
    vim.api.nvim_create_user_command(
      "PTest",
      function() require("FTerm").run({ "pnpm", "test" }) end,
      { bang = true }
    )

    -- push
    vim.api.nvim_create_user_command(
      "GPush",
      function() require("FTerm").scratch({ cmd = { "gpush" } }) end, -- my own `git push` alias
      { bang = true }
    )
  end,
  event = { 'BufEnter' },
}
