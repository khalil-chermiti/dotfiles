require("blink.cmp").setup({
	keymap = {
		-- Set to 'none' to avoid conflicts with your custom mappings
		preset = "none",

		["<Enter>"] = { "accept", "fallback" },

		-- Tab and Shift-Tab navigation
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },

		-- Traditional arrow keys (keeping these as well)
		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },

		-- Documentation toggle and navigation
		-- Use <C-f> to scroll down, <C-b> to scroll up
		["<C-space>"] = { "show_documentation", "hide_documentation", "fallback" },
		["<C-k>"] = { "scroll_documentation_up", "fallback" },
		["<C-j>"] = { "scroll_documentation_down", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = true,
	},

	completion = {
		-- Documentation settings
		documentation = {
			auto_show = false,
			-- auto_show_delay_ms = 200,
			window = {
				-- border = "rounded",
				-- max_width = 80,
				-- max_height = 20,
			},
		},
		list = { selection = { preselect = true, auto_insert = false } },
		menu = {
			draw = {
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "source_name" },
				},
				components = {
					label_description = {
						-- width = { max = 20 },
						text = function(ctx)
							return ctx.label_description or ""
						end,
					},
				},
			},
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
