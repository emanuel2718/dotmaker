require('nvim-treesitter.configs').setup{
  ensure_installed = {'c', 'cpp', 'python', 'lua', 'typescript', 'tsx',
                    'regex', 'bash', 'cmake', 'css', 'javascript',
                    'html', 'comment', 'java', 'rust', 'go', 'markdown',
                    'make', 'json', 'vim'},
  sync_install = false,
  ingnore_install = false,
  highlight = {
    enable = true,
    disable = {''},
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = {'yaml'}},
  context_commentstring = {
    enable = true,
    enable_autocmd = true
  }
}
