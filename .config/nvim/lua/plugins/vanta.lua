-- return { "emanuel2718/vanta.nvim", priority = 1000, config = true, opts = ... }
return {
  "emanuel2718/vanta.nvim",
  dir = "~/git/vanta.nvim",
  priority = 1000,
  config = function()
    require('vanta').setup({})
  end

}
