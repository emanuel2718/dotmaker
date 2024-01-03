return {
  "axelvc/template-string.nvim",
  opts = {
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
    remove_template_string = true,
    restore_quotes = {
      normal = [[']],
      jsx = [["]],
    },
  },
  event = "InsertEnter",
  ft = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
}
