vim.g.blink_enabled = true

require("blink.cmp").setup({
	enabled = function()
		return vim.g.blink_enabled
	end,

	keymap = {
		preset = "none",

		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<CR>"] = { "accept", "fallback" },

		["<Esc>"] = { "hide", "fallback" },

		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-k>"] = { "scroll_documentation_up", "fallback" },
		["<C-j>"] = { "scroll_documentation_down", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		ghost_text = { enabled = false },

		accept = { auto_brackets = { enabled = false } },

		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},

		documentation = {
			auto_show = false,
			auto_show_delay_ms = 200,
			window = { border = "none" },
		},

		menu = {
			border = "none",
			draw = {
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "kind" },
				},
			},
		},
	},

	signature = { enabled = true, window = { border = "none" } },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})
