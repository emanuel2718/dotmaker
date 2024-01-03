local M = {}

function M.check_file_size(lang, bufnr)
 return vim.api.nvim_buf_line_count(bufnr) > 10000
end

return M