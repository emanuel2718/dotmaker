return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            transparent = false,
            terminal_colors = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark",   -- style for floating windows
            },
        })
    end
}
