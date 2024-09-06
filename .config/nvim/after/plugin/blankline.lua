-- migrating to version 3
require("ibl").setup({
	scope = { enabled = false },
	exclude = {
		filetypes = {
			"help",
			"terminal",
			"lspinfo",
			"TelescopePrompt",
			"TelescopeResults",
			"mason",
			"packer",
			"dashboard",
		},
	},
})
