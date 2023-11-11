return {
  "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function()
      require("harpoon").setup()
    end,
    init = function()
      local map = require('utils').map

      map('n', "<leader>ha", function() require('harpoon.mark').add_file() end)

      map('n', "<leader>hh", ':Telescope harpoon marks theme=ivy<cr>')

      for i = 1, 4, 1 do
        map('n',"<leader>" .. i, function()
          require('harpoon.ui').nav_file(i)
        end)
      end
    end,

}
