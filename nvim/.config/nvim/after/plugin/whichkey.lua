local wk = require("which-key")

wk.setup({
	icons = {
		mappings = false, -- Disable all mapping icons
	},
})

wk.add({
	{ "<leader>o", desc = "oil explorer" },

	{ "<leader>l", group = "lsp" },
	{ "<leader>ld", desc = "definition" },
	{ "<leader>la", desc = "code actions" },
	{ "<leader>lR", desc = "rename" },
	{ "<leader>lr", desc = "references" },
	{ "<leader>li", desc = "implementations" },
	{ "<leader>lh", desc = "hover" },
	{ "<leader>lf", desc = "format" },
	{ "<leader>lH", desc = "inlay hints" },

	{ "<leader>d", group = "diagnostics" },

	{ "<leader>f", group = "telescope" },
	{ "<leader>ff", desc = "find files" },
	{ "<leader>fb", desc = "find buffers" },
	{ "<leader>fs", desc = "live grep" },
	{ "<leader>fg", desc = "search git" },
	{ "<leader>fc", desc = "search changes" },

	{ "<leader>g", group = "git" },
	{ "<leader>h", group = "harpoon" },

	{ "<leader>u", desc = "Toggle Undotree" },
	{ "<leader>s", desc = "Flash" },
	{ "<leader>c", desc = "Toggle completion" },
})
