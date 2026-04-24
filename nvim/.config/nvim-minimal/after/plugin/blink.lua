require("blink.cmp").setup({
	keymap = {
		preset = "none",

		["<Enter>"] = { "accept", "fallback" },

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },

		["<C-l>"] = { "show_documentation", "hide_documentation", "fallback" },
		["<C-h>"] = { "show_documentation", "hide_documentation", "fallback" },
		["<C-k>"] = { "scroll_documentation_up", "fallback" },
		["<C-j>"] = { "scroll_documentation_down", "fallback" },

		["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = true,
	},

	completion = {
		accept = {
			auto_brackets = {
				enabled = false,
			},
		},
		documentation = {
			auto_show = false,
			auto_show_delay_ms = 200,
			window = {
				-- border = "rounded",
				max_width = 80,
				max_height = 40,
			},
		},
		list = { selection = { preselect = true, auto_insert = false } },
		menu = {
			auto_show = true,
			draw = {
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "source_name" },
				},
				components = {
					label_description = {
						width = { max = 20 },
						text = function(ctx)
							return ctx.label_description or ""
						end,
					},

					label = {
						width = { max = 20 },
					},
				},
			},
		},
	},
	cmdline = {
		enabled = true,
		completion = {
			menu = { auto_show = false},
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		require("blink.cmp").show()
	end,
})
