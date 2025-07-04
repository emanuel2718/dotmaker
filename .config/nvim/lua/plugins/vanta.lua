-- return { "emanuel2718/vanta.nvim", priority = 1000, config = true, opts = ... }
return {
  "emanuel2718/vanta.nvim",
  dir = "~/git/vanta.nvim",
  config = function()
    require('vanta').setup({})
    vim.keymap.set("n", "<leader>sn", function()
      require("lazy").reload({ plugins = { "vanta.nvim" } }) -- built-in lazy API
      vim.notify("reloaded vanta.nvim", vim.log.levels.INFO, { title = "Lazy" })
    end, { desc = "Reload vanta.nvim", silent = true })
  end

}
