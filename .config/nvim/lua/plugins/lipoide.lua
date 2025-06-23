return {
  'FelipeIzolan/lipoide.nvim',
  config = function()
    require("lipoide").setup({
      transparent = false, -- boolean
      transparent_column = false, -- boolean
      comment_italic = false -- boolean
    })
  end
}
