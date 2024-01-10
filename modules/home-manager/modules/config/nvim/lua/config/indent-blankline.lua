vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("ibl").setup({
	enabled = true,
	indent = {
		char = "→",
		tab_char = "→",
	},
	whitespace = {
		remove_blankline_trail = false,
	},
})
