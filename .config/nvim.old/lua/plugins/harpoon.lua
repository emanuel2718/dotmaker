return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  config = function()
    require("harpoon").setup()
  end,
  init = function()
    local map = vim.keymap.set

    map("n", "<leader>ha", function()
      require("harpoon.mark").add_file()
    end, { noremap = true, silent = true })

    map("n", "<leader>hh", ":Telescope harpoon marks theme=ivy<cr>", { noremap = true, silent = true })

    for i = 1, 4, 1 do
      map("n", "<leader>" .. i, function()
        require("harpoon.ui").nav_file(i)
      end, { noremap = true, silent = true })
    end
  end,
}
