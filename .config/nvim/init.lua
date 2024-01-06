require("core.rami")
require('core.autocmds')
require("core.options")
require("core.keymaps")

PLUG("plugins.autopairs")
PLUG("plugins.treesitter")
PLUG("plugins.mason")
PLUG("plugins.lspconfig")
PLUG("plugins.conform")
PLUG("plugins.fidget")
PLUG('plugins.telescope')
PLUG("plugins.cmp")
PLUG("plugins.neogit")
PLUG("plugins.schemastore")


-- PLUG("plugins.colorscheme")
-- PLUG("plugins.devicons")
-- PLUG("plugins.whichkey")

require("core.lazy")

