local M = {}

function M.check_file_size(lang, bufnr)
 return vim.api.nvim_buf_line_count(bufnr) > 10000
end

M.opts = { noremap = true, silent = true }

M.map = function(mode, key, cmd, opts)
  vim.keymap.set(mode, key, cmd, opts or M.opts)
end


return M