return {
  "numToStr/Comment.nvim",
  keys = {
    { "gc", mode = { "n", "v" }, "gcc" },
  },
  config = function()
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
