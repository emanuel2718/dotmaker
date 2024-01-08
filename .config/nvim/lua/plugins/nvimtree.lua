local function on_attach(bufnr)
  local api = require('nvim-tree.api')
  local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
  local map = vim.keymap.set

  api.config.mappings.default_on_attach(bufnr)

  map('n', 'l', api.node.open.edit, opts)
  map("n", "h", api.node.navigate.parent_close, opts)
  map("n", "v", api.node.open.vertical, opts)
  vim.keymap.del("n", "<C-k>", { buffer = bufnr })

end

return {
      "nvim-tree/nvim-tree.lua",
   config = function()
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set
    map('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', opts)

    require('nvim-tree').setup({
      on_attach = on_attach,
      hijack_netrw = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {},
      },
    })
   end
}
