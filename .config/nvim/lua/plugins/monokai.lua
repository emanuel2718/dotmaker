return {
  "khoido2003/classic_monokai.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Default configuration
    require("classic_monokai").setup({
      style = "dark",

      hl_styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    })
  end
}
