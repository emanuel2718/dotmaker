 return {
        'dstein64/vim-startuptime',
        event = 'VeryLazy',
        cmd = 'StartupTime',
        config = function()
            vim.g.startuptime_tries = 10
        end,
}
