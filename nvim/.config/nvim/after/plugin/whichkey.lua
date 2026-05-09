local wk = require("which-key")

require("which-key").setup({
	icons = {
		mappings = false, -- Disable all mapping icons
	},
})

wk.add({
	{ "<leader>e", desc = "toggle explorer" },

	{ "<leader>l", group = "lsp" },
	{ "<leader>ld", desc = "definition" },
	{ "<leader>la", desc = "code actions" },
	{ "<leader>lR", desc = "rename" },
	{ "<leader>lr", desc = "references" },
	{ "<leader>li", desc = "implementations" },
	{ "<leader>lh", desc = "hover" },
	{ "<leader>lf", desc = "format" },
	{ "<leader>lm", desc = "diagnostic float" },
	{ "<leader>lM", desc = "diagnostic qf" },
	{ "Ctls", desc = "signature help" },

	{ "<leader>f", group = "telescope" },
	{ "<leader>ff", desc = "find files" },
	{ "<leader>fb", desc = "find buffers" },
	{ "<leader>fs", desc = "live grep" },
	{ "<leader>fg", desc = "search git" },
	{ "<leader>fc", desc = "search changes" },
	{ "<leader>fh", desc = "harpoon" },

	{
		mode = "n",
		{ "<leader>u", desc = "Toggle Undotree" },
	},
	{ mode = "n", { "<leader>q", group = "quickfix" } },

	{
		mode = "n",
		{ "<leader>hs", desc = "Stage Hunk" },
		{ "<leader>h", group = "gitsigns" },
		{ "<leader>hr", desc = "Reset Hunk" },

		{ "<leader>hp", desc = "Preview Hunk" },
		{ "<leader>hS", desc = "Stage Buffer" },
		{ "<leader>hR", desc = "Reset Buffer" },
	},

	{
		mode = "n",
		{ "<leader>s", desc = "Flash" },
	},
})
