return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	dependencies = {
    {
		  "nvim-treesitter/nvim-treesitter-textobjects",
			init = function()
				local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
				local opts = require("lazy.core.plugin").values(plugin, "opts", false)
				local enabled = false
				if opts.textobjects then
					for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
						if opts.textobjects[mod] and opts.textobjects[mod].enable then
							enabled = true
							break
						end
					end
				end
				if not enabled then
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end
			end
     }
	},
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"gitignore",
				"go",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"prisma",
				"python",
				"rust",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"yaml",
			},
			highlight = {
				enable = true,
				use_languagetree = true
			},
			indent = {
				enable = true
			},
			autotag = {
				enable = true
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false
			},
			refactor = {
				highlight_definitions = {
					enable = true
				},
				highlight_current_scope = {
					enable = false
				}
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
		})
	end
}
