require("blink.cmp").setup({
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
		ghost_text = { enabled = true },

		accept = { auto_brackets = { enabled = true } },

		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},

		documentation = {
			auto_show = false,
			auto_show_delay_ms = 200,
			window = { border = "rounded" },
		},

		menu = {
			draw = {
				columns = {
					{ "kind_icon", "label", gap = 1 },
					{ "kind" },
				},
			},
		},
	},

	signature = { enabled = true },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})
