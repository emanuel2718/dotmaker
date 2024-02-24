return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      local opts = { noremap = true, silent = true }
      local map = vim.keymap.set

      local harpoon = require("harpoon")
      map("n", "<TAB>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
      map("n", "<C-m>", function()
        harpoon:list():append()
        vim.notify("[harpoon] marked file ")
      end, opts)

      harpoon:setup()
      

        -- local harpoon_mark = require('harpoon.mark')
        --
        -- map("n", "<C-m>", function()
        --     require('harpoon.mark').add_file()
        --     vim.notify " marked file"
        -- end, opts)
        --
        -- map("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
    end

}
