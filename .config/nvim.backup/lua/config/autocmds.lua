local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = "200"
    })
  end
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "",
  command = ":%s/\\s\\+$//e"
})

-- Auto format on save using the attached (optionally filtered) language servere clients
-- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
-- autocmd("BufWritePre", {
--   pattern = "",
--   command = ":silent lua vim.lsp.buf.format()"
-- })

-- local lsp_fmt_group = augroup("LspFormattingGroup", {})
-- autocmd("BufWritePre", {
--   group = lsp_fmt_group,
--   callback = function()
--     local efm = vim.lsp.get_active_clients({ name = "efm" })
--
--     if vim.tbl_isempty(efm) then
--       return
--     end
--
--     vim.lsp.buf.format({ name = "efm", async = true })
--   end,
-- })


-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o"
})

-- Set filetype with 2 spaces indentation
autocmd("Filetype", {
  pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
  command = "setlocal shiftwidth=2 tabstop=2"
})


-- Set filetype with 4 spaces indentation
autocmd("Filetype", {
  pattern = { "python", "rust", "go", "ruby", "java", "c", "cpp", "php" },
  command = "setlocal shiftwidth=4 tabstop=4"
})


-- Set colorcolumn
autocmd("Filetype", {
  pattern = { "python", "rst", "c", "cpp" },
  command = "set colorcolumn=80"
})

autocmd("Filetype", {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end
})
