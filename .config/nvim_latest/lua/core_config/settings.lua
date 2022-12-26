-- vim.opt['background'] = 'dark'
vim.opt['termguicolors'] = true
vim.opt['number'] = true
vim.opt['guifont'] = 'TerminessTTF Nerd Font:h18'
vim.opt['relativenumber'] = true
vim.opt['modifiable'] = true
vim.opt['ruler'] = true
vim.opt['numberwidth'] = 1
vim.opt['tabstop'] = 2
vim.opt['shiftwidth'] = 2
vim.opt['shiftround'] = true
vim.opt['expandtab'] = true
vim.opt['mouse'] = 'a'
vim.opt['foldlevel'] = 99
vim.opt['foldenable'] = true
vim.opt['foldmethod'] = 'expr'
vim.opt['foldexpr'] = 'nvim_treesitter#foldexpr()'
vim.opt['autoindent'] = true
vim.opt['cursorline'] = true
vim.opt['encoding'] = 'utf-8'
vim.opt['fileencoding'] = 'utf-8'
vim.opt['showmode'] = false
vim.opt['clipboard'] = 'unnamedplus'
vim.opt['updatetime'] = 50 -- faster completion
vim.opt['swapfile'] = false
vim.opt['laststatus'] = 3
vim.opt['splitbelow'] = true
vim.opt['splitright'] = true
vim.opt['textwidth'] = 79
vim.opt['wildmenu'] = true
vim.opt['writebackup'] = false
vim.opt['smartcase'] = true
vim.opt['errorbells'] = false
vim.opt['cindent'] = true
vim.opt['ignorecase'] = true
vim.opt['hlsearch'] = false
vim.opt['incsearch'] = true
vim.opt['wrap'] = false
vim.opt['scrolloff'] = 8
vim.opt['sidescrolloff'] = 8
vim.opt['wildignore'] = '*.swp, *.bak, *.pyc, *.class'
vim.opt['undofile'] = true
vim.opt['undodir'] = os.getenv('HOME')..'/.cache/nvim/undo'
vim.opt['undolevels'] = 1000
vim.opt['undoreload'] = 10000



-- NEVER insert comment on newline
vim.cmd('autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o')
vim.cmd('command CDD cd %:p:h')

vim.cmd('autocmd BufWinEnter * setlocal modifiable')

-- trim whitespace
--autocmd("BufWritePre", {
--  pattern = "*",
--  callback = function()
--    exec(
--      [[
--        function! NoWhitespace()
--          let l:save = winsaveview()
--          keeppatterns %s/\s\+$//e
--          call winrestview(l:save)
--        endfunction
--        call NoWhitespace()
--        ]],
--      true
--    )
--  end,
--})



