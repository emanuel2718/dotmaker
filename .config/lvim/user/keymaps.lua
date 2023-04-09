local nmap = lvim.keys.normal_mode
local imap = lvim.keys.insert_mode
local vmap = lvim.keys.visual_mode
local wkmap = lvim.builtin.which_key.mappings

lvim.leader = "space"
-- add your own keymapping

nmap["<C-s>"] = ":w<cr>"

-- Q, please don't be doing random shit
nmap["q"] = "<nop>"
nmap["Q"] = "<nop>"
nmap["J"] = "<nop>"

-- Disable default move lines
nmap["<A-j>"] = ""
nmap["<A-k>"] = ""
imap["<A-j>"] = ""
imap["<A-k>"] = ""
vmap["<A-j>"] = ""
vmap["<A-k>"] = ""


-- Respect system clipboard unless told otherwise
nmap['<leader>y'] = '[["+y]]'
vmap['<leader>y'] = '[["+y]]'
nmap['<leader>Y'] = '[["+Y]]'


-- Split windows
wkmap['wv'] = { ':vsplit<cr>', 'Vertical Window Split' }
wkmap['wh'] = { ':split<cr>', 'Horizontal Window Split' }

-- Emacs window movement
wkmap['wh'] = { "<C-w>h", "Move to Left Window" }
wkmap['wj'] = { "<C-w>j", "Move to Lower Window" }
wkmap['wk'] = { "<C-w>k", "Move to Upper Window" }
wkmap['wl'] = { "<C-w>l", "Move to Right Window" }

-- General stuff
wkmap['fs'] = { "<cmd>w<cr>", "File Save" }
wkmap['wd'] = { "<cmd>q<cr>", "Close Window" }

wkmap['`'] = { "<cmd>e #<cr>", "Switch to last buffer" }



-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"

-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
