require('spectre').setup({
  mapping = {
    ['run_current_replace'] = {
      map = "<Tab>",
      cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
      desc = "replace current line"
    }
  }
})

