local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("FileType", {
 pattern = "TelescopeResults",
 callback = function(ctx)
   vim.api.nvim_buf_call(ctx.buf, function()
     vim.fn.matchadd("TelescopeParent", "\t\t.*$")
     vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
   end)
 end,
})
