local formatter_prettier = {
  function()
    return {
      exe = "prettierd",
      args = { vim.api.nvim_buf_get_name(0) },
      stdin = true
    }
  end
}

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = formatter_prettier,
    javascriptreact = formatter_prettier,
    typescript = formatter_prettier,
    typescriptreact = formatter_prettier,
    json = formatter_prettier,
    graphql = formatter_prettier,
    lua = formatter_prettier
  }
})

vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.ts,*.tsx,*.mjs,*.js,*.jsx,*.json,*.graphql FormatWrite
  augroup END
  ]], true)
