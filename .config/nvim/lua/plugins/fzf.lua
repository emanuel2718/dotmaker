return {
  'ibhagwan/fzf-lua',
  config = function()
    local fzf = require('fzf-lua')
    fzf.setup {}
    local map = require('rami.utils').map

    map('n', '<leader>ff', function() fzf.files { previewer = false, hidden = true } end)
    map('n', '<leader>gs', function() fzf.git_status {} end)
    map('n', '<leader>gc', function() fzf.git_commits {} end)
  end
}
