local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

g.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termguicolors = true

opt.scrolloff = 10
opt.sidescrolloff = 8

opt.number = true
opt.relativenumber = true

opt.cursorline = true

opt.hidden = true
opt.mouse = "a"

opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.shiftround = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.cmdheight = 1
opt.showmode = false
opt.lazyredraw = true

opt.history = 5000
opt.undofile = true
-- opt.timeoutlen = 400

opt.grepprg = "rg --ignore-case --vimgrep"

opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.linebreak = true

opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

opt.path = "**"
opt.wildignorecase = true
opt.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/.nuxt/**,**/target/**,**.terraform/**,**/coverage/**"
]]

opt.fcs = "eob: " -- hide `~` char on empty line at the end of the buffer

opt.showbreak = "↳ " -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
opt.fillchars = {
  eob = " ", -- Suppress ~ at EndOfBuffer
  fold = " ", -- Hide trailing folding characters
  diff = "╱",
  foldopen = "",
  foldclose = "",
}

-- opt.signcolumn = "yes"
-- opt.statuscolumn =
--   "%C%=%4{&nu && v:virtnum <= 0 ? (&rnu ? (v:lnum == line('.') ? v:lnum . ' ' : v:relnum) : v:lnum) : ''}%=%s"

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

cmd.colorscheme("habamax")
