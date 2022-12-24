
local fugitive = vim.api.nvim_create_augroup("fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>gP", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase
        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts);
    end,
})