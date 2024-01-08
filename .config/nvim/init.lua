require("core.rami")
require('core.autocmds')
require("core.options")
require("core.keymaps")

PLUG("plugins.lsp.config")

PLUG("plugins.autopairs")
PLUG("plugins.treesitter")
PLUG("plugins.mason")
PLUG("plugins.conform")
PLUG("plugins.fidget")
PLUG('plugins.telescope')
PLUG("plugins.cmp")
PLUG("plugins.neogit")
PLUG("plugins.schemastore")
PLUG("plugins.lualine")
PLUG("plugins.terminal")
PLUG("plugins.comment")
PLUG("plugins.gitsigns")
PLUG("plugins.md-preview")
PLUG("plugins.trouble")
PLUG("plugins.copilot")
PLUG("plugins.oil")
PLUG("plugins.nvimtree")
-- PLUG("plugins.harpoon")
PLUG("plugins.colorizer")
PLUG("plugins.toggle-diagnostics")

PLUG('plugins.cellular-automaton')


-- PLUG("plugins.colorscheme")
-- PLUG("plugins.devicons")
-- PLUG("plugins.whichkey")

require("core.lazy")

