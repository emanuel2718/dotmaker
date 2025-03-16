return {
    'VVoruganti/today.nvim',
    config = function()
        require('today').setup({
            local_root = os.getenv("HOME") .. "/workspace/notes",
            template = "templates/jrnl.md"
        })
    end

}
