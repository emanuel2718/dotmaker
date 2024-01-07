return {
    "ThePrimeagen/harpoon",
    dependencies = {{"nvim-lua/plenary.nvim"}},
    config = function()
        local opts = { noremap = true, silent = true }
        local map = vim.keymap.set
        local harpoon_mark = require('harpoon.mark')

        map("n", "<C-m>", function()
            require('harpoon.mark').add_file()
            vim.notify " marked file"
        end, opts)

        map("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
    end

}
